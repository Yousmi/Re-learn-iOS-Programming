//
//  108. 将有序数组转换为二叉搜索树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_108 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let res = buildNode(nums,0, nums.count - 1)
        return res
    }

    private func buildNode(_ nums:[Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = left + (right - left) / 2
        let root = TreeNode(nums[mid])
        root.left = buildNode(nums, left, mid - 1)
        root.right = buildNode(nums, mid + 1, right)
        return root
    }
}
