//
//  102.二叉树的层序遍历.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/5.
//  Copyright © 2020 钱志新. All rights reserved.
//
//给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）
import Foundation
class Solution_102 {
    // mark: - BFS
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        //利用数组双端队列
        var queue = [TreeNode](), res = [[Int]]()
        queue.append(root!)
        while queue.count > 0 {
            var i = [Int]()
            for _ in 0 ..< queue.count {
                let it = queue.removeFirst()
                i.append(it.val)
                if let left = it.left {
                    queue.append(left)
                }
                if let right = it.right {
                    queue.append(right)
                }
            }
            res.append(i)
        }
        return res
    }
    
    
    // MARK: - DFS
    func levelOrder_1(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var res = [[Int]]()
        _level(root, 0, &res)
        return res
    }
    private func _level(_ root: TreeNode?, _ level: Int, _ res: inout [[Int]]) {
        guard root != nil else {
            return
        }
        if res.count == level {
            let item = [Int]()
            res.append(item)
        }
        res[level].append(root!.val)
        if let left = root!.left {
            _level(left, level + 1, &res)
        }
        if let right = root!.right {
            _level(right, level + 1, &res)
        }
    }
}
