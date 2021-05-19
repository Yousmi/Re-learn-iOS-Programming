//
//  199.二叉树的右视图.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_199 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var res = [Int](), temp = [[Int]]()
        func dfs(_ root: TreeNode?, _ level: Int) {
            if root == nil {
                return
            }
            if level == temp.count {
                temp.append([Int]())
            }
            temp[level].append(root!.val)
            dfs(root?.left, level + 1)
            dfs(root?.right, level + 1)
        }
        dfs(root, 0)
        for i in temp {
            res.append(i.last!)
        }
        return res
    }
    
    func rightSideView_2(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var queue: [TreeNode] = [root!], res = [Int]()
        while queue.count > 0 {
            res.append(queue.last!.val)
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return res
    }
    
    func rightSideView_1(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var queue = [TreeNode](), levelRes = [[Int]]()
        var res = [Int]()
        queue.append(root!)
        while queue.count > 0 {
            var temp = [Int]()
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                temp.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            levelRes.append(temp)
        }
        
        for i in levelRes {
            res.append(i.last!)
        }
        return res
    }
}
