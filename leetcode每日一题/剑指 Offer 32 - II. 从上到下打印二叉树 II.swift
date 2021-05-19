//
//  剑指 Offer 32 - II. 从上到下打印二叉树 II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/15.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_32_2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var queue:[TreeNode] = [root!], res = [[Int]]()
        while !queue.isEmpty {
            var item = [Int]()
            for _ in 0 ..< queue.count {
                let temp = queue.removeFirst()
                item.append(temp.val)
                if let left = temp.left {
                    queue.append(left)
                }
                if let right = temp.right {
                    queue.append(right)
                }
            }
            res.append(item)
        }
        return res
    }
}
