//
//  15.三数之和.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        let nums = nums.sorted()
        var res = [[Int]]()
        for i in 0 ..< nums.count - 2  {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var left = i + 1, right = nums.count - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    res.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                    while left < right && nums[left] == nums[left - 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right + 1] {
                        right -= 1
                    }
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return res
    }
    
    func threeSum_1(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        let nums = nums.sorted()
        var res: Set<[Int]> = Set()
        for i in 0 ..< nums.count - 2 {
            let v = nums[i]
            if v > 0 {
                break
            }
            if i > 0 && v == nums[i - 1]  {
                continue
            }
            var left = i + 1, right = nums.count - 1
            while  left < right {
                let lv = nums[left], rv = nums[right]
                if v + lv + rv == 0 {
                    res.insert([v, lv, rv])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if (v + lv + rv) < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return Array(res)
    }
}
