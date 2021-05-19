//
//  112. 路径总和.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/22.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_112 {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        func dfs(_ root: TreeNode?, _ sum: Int, _ levelSum: Int) -> Bool {
            //terminator
            if root == nil {
                return false
            }
            //cur level logic
            var curSum = levelSum + root!.val
            if curSum == sum && root?.left == nil && root?.right == nil  {
                return true
            } else {
                //drill down
                let leftRes = dfs(root?.left, sum, curSum)
                let rightRes = dfs(root?.right, sum, curSum)
                //reverse status
                curSum -= root!.val
                return leftRes || rightRes
            }
        }
        return dfs(root, sum, 0)
    }
}
