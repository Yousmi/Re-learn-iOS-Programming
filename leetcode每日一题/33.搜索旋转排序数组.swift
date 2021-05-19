//
//  33.搜索旋转排序数组.swift
//  INTERVIEW
//
//  Created by 钱志新(平安科技快乐平安团队iOS开发组) on 2020/8/4.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
class Solution_33 {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        return binarySearch(nums, target, 0, nums.count - 1)
    }
    private func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int {
        if left >= right {
            return -1
        }
        let mid = left + (right - left) >> 1
        if nums[mid] == target {
            return mid
        } else {
            if nums[left] <= nums[mid] { //左边是升序
                if target >= nums[left] && nums[mid]  > target {
                    return binarySearch(nums, target, left, mid - 1)
                } else {
                    return binarySearch(nums, target, mid + 1, right)
                }
            } else {
                if target > nums[mid] && nums[right] >= target {
                    return binarySearch(nums, target, mid + 1, right)
                } else {
                     return binarySearch(nums, target, left , mid - 1)
                }
            }
        }
    }
}
