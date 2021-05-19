//
//  18.四数之和.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/27.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_18 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }
        var set: Set<[Int]> = Set()
        let nums = nums.sorted()
        for i in 0 ... nums.count - 3 {
            for j in (i + 1) ... nums.count - 2 {
                var left = j + 1, right = nums.count - 1
                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if target == sum {
                        let item = [nums[i], nums[j], nums[left], nums[right]]
                        set.insert(item)
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if (sum > target) {
                        right -= 1
                    } else {
                        left += 1
                    }
                }
            }
        }
        return Array(set)
    }
}
