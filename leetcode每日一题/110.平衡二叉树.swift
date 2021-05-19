//
//  110.平衡二叉树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/15.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_110 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return dfs(root) != -1
    }
    
    private func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = dfs(root?.left)
        let right = dfs(root?.right)
        if abs(left - right) > 1 || right == -1 || left == -1 {
            return -1
        }
        return max(left, right) + 1
    }
//    func isBalanced(_ root: TreeNode?) -> Bool {
//        if root == nil {
//            return true
//        }
//        let left = maxDep(root?.left)
//        let right = maxDep(root?.right)
//        if abs(left - right) >= 2 {
//            return false
//        }
//        return isBalanced(root?.left) && isBalanced(root?.right)
//    }
//    private func maxDep(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        let left = maxDep(root?.left)
//        let right = maxDep(root?.right)
//        return max(left, right) + 1
//    }
    
//    func isBalanced(_ root: TreeNode?) -> Bool {
//        var l = [[Int]](), r = [[Int]]()
//        _level(root?.left, &l, 0)
//        _level(root?.right, &r, 0)
//        return  abs(l.count - r.count) <= 1
//    }
//
//    private func _level(_ root: TreeNode?, _ res: inout [[Int]], _ level: Int) {
//        if root == nil {
//            return
//        }
//        if level == res.count {
//            let tem = [Int]()
//            res.append(tem)
//        }
//        res[level].append(root!.val)
//        if let left = root?.left {
//            _level(left, &res, level + 1)
//        }
//        if let right = root?.right {
//            _level(right, &res, level + 1)
//        }
//    }
}
