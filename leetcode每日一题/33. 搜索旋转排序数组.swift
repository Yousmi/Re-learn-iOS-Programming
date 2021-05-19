//
//  33. 搜索旋转排序数组.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/1.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        return revSearch(nums, target, 0, nums.count - 1)
    }

    private func revSearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
        if left > right {
            return -1
        }
        let mid = left + (right - left) / 2
        if nums[mid] == target {
            return mid
        } else {
            if nums[left] <= nums[mid] {//左边有序
                if nums[left] <= target && nums[mid] > target {
                    return revSearch(nums, target, left, mid - 1)
                } else {
                    return revSearch(nums, target, mid + 1, right)
                }
            } else { //右边有序
                if nums[mid] < target && nums[right] >= target {
                    return revSearch(nums, target, mid + 1, right)
                } else {
                    return revSearch(nums, target, left, mid - 1)
                }
            }
        }
    }
}
