//
//  530. 二叉搜索树的最小绝对差.swift
//  INTERVIEW
//
//  Created by Scan on 2020/10/13.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//给你一棵所有节点为非负值的二叉搜索树，请你计算树中任意两节点的差的绝对值的最小值。
class Solution_530 {
    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var prev: TreeNode? = root, stack = [TreeNode]()
        var res = Int.max, temp: TreeNode?
        while prev != nil || stack.count > 0 {
            while prev != nil {
                stack.append(prev!)
                prev = prev?.left
            }
            prev = stack.popLast()
            if temp == nil {
                temp = prev
            } else {
                res = min(res, abs(temp!.val - prev!.val))
                temp = prev
            }
            prev = prev?.right
        }
        return res
    }
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var res = Int.max, preNode: TreeNode?
        var stack = [TreeNode](), temp = root
        while temp != nil || stack.count > 0 {
            while temp != nil {
                stack.append(temp!)
                temp = temp!.left
            }
            temp = stack.popLast()
            if preNode == nil {
                preNode = temp
            }else{
                res = min(abs(temp!.val - preNode!.val), res)
                preNode = temp
            }
            temp = temp?.right
        }
        return res
    }
    
    func getMinimumDifference_1(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var res = Int.max, prev: TreeNode? = nil
        func dfs(_ root: TreeNode?) {
            if root == nil {
                return
            }
            dfs(root?.left)
            if prev == nil {
                prev = root
            } else {
                res = min(abs(root!.val - prev!.val), res)
                prev = root
            }
            dfs(root?.right)
        }
        dfs(root)
        return res
    }
 
}
