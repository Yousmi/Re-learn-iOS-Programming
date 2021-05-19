//
//  129. 求根到叶子节点数字之和.swift
//  INTERVIEW
//
//  Created by Scan on 2020/10/29.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_129 {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        func dfs(_ root: TreeNode?, _ pre: Int) -> Int {
            if root == nil {
                return 0
            }
            let temp = pre * 10 + root!.val
            if root?.left == nil && root?.right == nil {
                return temp
            } else {
                let left = dfs(root?.left, temp)
                let right = dfs(root?.right, temp)
                return left + right
            }
        }
        return dfs(root, 0)
    }
}
