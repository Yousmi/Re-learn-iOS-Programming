//
//  104.二叉树的最大深度.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/29.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = maxDepth(root?.left) + 1
        let right = maxDepth(root?.right) + 1
        return max(left, right)
    }
}
