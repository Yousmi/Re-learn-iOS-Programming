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
        guard root != nil else {
            return 0
        }
        var item = [TreeNode](), res = 0
        item.append(root!)

        while item.count > 0 {
            res += 1
            var inner = [TreeNode]()
            for i in 0 ..< item.count {
                let node = item[i]
                if let left = node!.left {
                    inner.append(left)
                }
                if let right = node!.right {
                    inner.append(right)
                }
            }
            item = inner
        }
        return res
    }

    func maxDepth_1(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = maxDepth(root?.left) + 1
        let right = maxDepth(root?.right) + 1
        return max(left, right)
    }
}
