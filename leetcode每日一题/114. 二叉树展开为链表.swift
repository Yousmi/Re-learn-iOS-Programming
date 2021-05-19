//
//  114. 二叉树展开为链表.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/2.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_114 {
    func flatten(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        var queue: [TreeNode] = [root!]
        var tmp: TreeNode?
        while queue.count > 0 {
            let node = queue.removeLast()
            if let right = node.right {
                queue.append(right)
            }
            if let left = node.left {
                queue.append(left)
            }
            if tmp == nil {
                tmp = node
            } else {
                tmp?.left = nil
                tmp?.right =  node
                tmp = tmp?.right
            }
        }
    }
    
    func flatten_1(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        var res = [TreeNode]()
        preOrder(root, &res)
        conv2Link(root, &res)
    }
    private func preOrder(_ root: TreeNode?, _ res: inout [TreeNode]) {
        if root == nil {
            return
        }
        res.append(root!)
        if let left = root?.left {
            preOrder(left, &res)
        }
        if let right = root?.right {
            preOrder(right, &res)
        }
    }
    private func conv2Link(_ root: TreeNode?, _ res: inout [TreeNode]) {
        var cur = root
        for i in 1 ..< res.count {
            let node = res[i]
            cur?.left = nil
            cur?.right = node
            cur = node
        }
    }
}
