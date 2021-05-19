//
//  53.最大子序和.swift
//  INTERVIEW
//
//  Created by 钱志新(平安科技快乐平安团队iOS开发组) on 2020/8/21.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var dp = nums, res = nums[0]
        for i in 1 ..< nums.count {
            dp[i] = max(dp[i - 1] + nums[i], nums[i])
            res = max(res, dp[i])
        }
        return res
    }
    
    func maxSubArray_1(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var res = nums[0], sum = 0
        for i in nums {
            if sum > 0 {
                sum += nums[i]
            } else {
                sum = i
            }
            res = max(res, sum)
        }
        return res
    }
}
