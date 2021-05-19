//
//  337. 打家劫舍 III.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/6.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_337 {
    func rob(_ root: TreeNode?) -> Int {
        let res = dfs(root)
        return max(res.0, res.1)
    }

    private func dfs(_ root: TreeNode?) -> (Int, Int) {
        if root == nil {
            return (0, 0)
        }
        let left = dfs(root?.left)
        let right = dfs(root?.right)
        var res = (0, 0)
        res.0 = max(left.0, left.1) + max(right.0, right.1)
        res.1 = left.0 + right.0 + root!.val
        return res
    }
}
