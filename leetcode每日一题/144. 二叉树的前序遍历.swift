//
//  144. 二叉树的前序遍历.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/5.
//  Copyright © 2020 钱志新. All rights reserved.
//
//给定一个二叉树，返回它的 前序 遍历。
import Foundation

class Solution_144 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        func dfs(_ root: TreeNode?) {
            if root == nil {
                return
            }
            res.append(root!.val)
            dfs(root?.left)
            dfs(root?.right)
        }
        dfs(root)
        return res
    }
    
    func preorderTraversal_1(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        //用stack 来记录访问路径， FILO  先进后出规则来断定先 push 右节点，在左节点，
        var res = [Int](),stack = [TreeNode]()
        stack.append(root!)
        while stack.count > 0 {
            let temp = stack.popLast()!
            res.append(temp.val)
            if temp.right != nil {
                stack.append(temp.right!)
            }
            if temp.left != nil {
                stack.append(temp.left!)
            }
        }
        return res
    }
}

