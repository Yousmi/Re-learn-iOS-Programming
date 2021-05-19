//
//  94.二叉树的中序遍历.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/5.
//  Copyright © 2020 钱志新. All rights reserved.
//
//给定一个二叉树，返回它的中序 遍历。
//进阶: 递归算法很简单，你可以通过迭代算法完成吗？
import Foundation

class Solution_94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        _inorderTraversal(root, &res)
        return res
    }
    
    private func _inorderTraversal(_ root: TreeNode?, _ res: inout [Int]) {
        if root == nil { return }
        if (root!.left != nil) {
            _inorderTraversal(root!.left, &res)
        }
        res.append(root!.val)
        if (root!.right != nil) {
            _inorderTraversal(root!.right, &res)
        }
    }
    
    func inorderTraversal_1(_ root: TreeNode?) -> [Int] {
        var res:[Int] = []
        var stack:[TreeNode] = []
        var temp = root
        while temp != nil || stack.count > 0 { // 每取一个值记为一个迭代完成
            while temp != nil {     // 把左边的都加进去
                stack.append(temp!)
                temp = temp!.left
            }
            temp = stack.popLast() //开始取值
            res.append(temp!.val)
            temp = temp?.right     // 当前迭代完成之后 指为右子树
        }
        return res
    }
}
