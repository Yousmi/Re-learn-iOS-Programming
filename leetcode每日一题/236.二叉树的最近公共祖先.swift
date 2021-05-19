//
//  236.二叉树的最近公共祖先.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/12.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_236 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        //终止条件
        if root == nil {
            return nil
        }
        if root === p || root === q {
            return root
        }
        //当层处理
        //进入到下一层
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        if left != nil && right != nil {
            return root
        }
        return left != nil ? left : right
        //可能清理状态
    }
    
    
    func lowestCommonAncestor_1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root === p || root === q {
            return root
        }
        let left = lowestCommonAncestor_1(root?.left, p, q)
        let right = lowestCommonAncestor_1(root?.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        return left == nil ? right : left
    }
}
