//
//  100.相同的树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/9.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
//给定两个二叉树，编写一个函数来检验它们是否相同。
//如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
class Solution_100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil {
            return false
        }
        if p!.val != q!.val {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
