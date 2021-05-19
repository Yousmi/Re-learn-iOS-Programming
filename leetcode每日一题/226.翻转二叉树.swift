//
//  226.翻转二叉树.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        let left = root?.left
        root?.left = invertTree(root?.right)
        root?.right = invertTree(left)
        return root
    }
    
    func invertTree_1(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        _invertTree(root)
        return root
    }
    private func _invertTree(_ root: TreeNode?) {
        if root == nil {
            return
        }
        let left: TreeNode? = root?.left ?? nil
        let right: TreeNode? = root?.right ?? nil
        root?.left = right
        root?.right = left
        _invertTree(left)
        _invertTree(right)
    }
}
