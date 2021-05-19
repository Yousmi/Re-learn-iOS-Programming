//
//  111.二叉树的最小深度.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_111 {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root!.left == nil && root!.right == nil {
            return 1
        }
        let left = minDepth(root?.left)
        let right = minDepth(root?.right)
        if root!.left == nil || root!.right == nil {
            return max(left, right) + 1
        }
        return min(left, right) + 1
    }
    
    func minDepth_1(_ root: TreeNode?) -> Int {
        return bfs(root)
    }
    
    private func bfs(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var res = 0, queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            res += 1
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil {
                    return res
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return res
    }
}
