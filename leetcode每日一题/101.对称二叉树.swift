//
//  101.对称二叉树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/20.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定一个二叉树，检查它是否是镜像对称的。
import Foundation

class Solution_101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil {
                return true
            } else if (p == nil || q == nil) || (p?.val != q?.val) {
                return false
            }
            return dfs(p?.left, q?.right) && dfs(p?.right, q?.left)
        }
        return dfs(root, root)
    }
}
