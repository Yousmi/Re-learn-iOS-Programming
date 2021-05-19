//
//  437.路径总和III.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/20.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_437 {
    //递归 + 前缀和
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        var res = 0
        func dfs(_ root: TreeNode?, _ prefixSum: inout [Int: Int], _ pathSum: Int) {
            if root == nil {
                return
            }
            let pathSum = pathSum + root!.val
            res += prefixSum[pathSum - sum] ?? 0
            
            prefixSum[pathSum, default: 0] += 1
            
            dfs(root?.left, &prefixSum, pathSum)
            dfs(root?.right, &prefixSum, pathSum)
            
            prefixSum[pathSum, default: 0] -= 1
        }
        var prefixSum = [0: 1]
        dfs(root, &prefixSum, 0)
        return res
    }
    
    
    func pathSum_1(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        func dfs(_ root: TreeNode?, _ sum: Int) -> Int {
            if root == nil {
                return 0
            }
            var count = 0
            if root!.val == sum {
                count += 1
            }
            return count + dfs(root?.left, sum -  root!.val) + dfs(root?.right, sum -  root!.val)
        }
        return pathSum(root?.left, sum) + pathSum(root?.right, sum) + dfs(root, sum)
    }
    
    //错误的解法，，原题意思是 可以从根节点同时想左右子树扩散，
    func pathSum_xxxx(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        var res = 0
        func dfs(_ root: TreeNode?, _ left: Int, _ target: Int, _ count: inout Int) {
            if root == nil {
                return
            }
            if root!.val > left || root!.val == left {
                count += root!.val == left ? 1 : 0
                dfs(root?.left, target, target, &count)
                dfs(root?.right, target, target, &count)
            } else  {
                dfs(root?.left, left - root!.val, target, &count)
                dfs(root?.right, left - root!.val, target, &count)
            }
        }
        dfs(root?.left, sum, sum, &res)
        dfs(root?.right, sum, sum, &res)
        return res
    }
}
