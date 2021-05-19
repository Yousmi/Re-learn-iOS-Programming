//
//  701.二叉搜索树中的插入操作.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/7.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_701 {
    
    func insertIntoBST_2(_ root: TreeNode?, _ val: Int) -> TreeNode? {
       if root == nil  { return TreeNode(val) }
        var node: TreeNode = root!
        if node.val > val {
            node.left = insertIntoBST_2(node.left, val)
        } else  {
            node.right = insertIntoBST_2(node.right, val)
        }
        return node
    }

    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
        insert(root, val)
        return root
    }
    private func insert(_ root: TreeNode?, _ val: Int) {
        if root?.left == nil && root?.right == nil {
            let node = TreeNode(val)
            (root!.val > val) ? (root?.left = node) : (root?.right = node)
        } else if root?.left == nil || root?.right == nil {
            if root?.left != nil {
                if val > root!.val {
                    root?.right = TreeNode(val)
                } else {
                    insert(root?.left, val)
                }
            } else {
                if val < root!.val {
                    root?.left = TreeNode(val)
                } else {
                    insert(root?.right, val)
                }
            }
        } else {
            insert(val > root!.val ? root?.right : root?.left, val)
        }
    }

    func insertIntoBST_1(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
        dfsInsert(root, val)
        return root
    }

    private func dfsInsert(_ root: TreeNode?, _ val: Int) {
        if root?.left == nil && root?.right == nil {
            (val > root!.val) ? (root?.right = TreeNode(val)) : (root?.left = TreeNode(val))
            return
        }
        if root?.left == nil || root?.right == nil {
            if val > root!.val {
                if root?.right != nil {
                    dfsInsert(root?.right, val)
                } else {
                    root?.right = TreeNode(val)
                }
            } else {
                if root?.left != nil {
                    dfsInsert(root?.left, val)
                } else {
                    root?.left = TreeNode(val)
                }
            }
            return
        }
        dfsInsert(val > root!.val ? root?.right : root?.left, val)
    }
}
