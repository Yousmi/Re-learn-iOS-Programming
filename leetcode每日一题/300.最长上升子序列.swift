//
//  300.最长上升子序列.swift
//  INTERVIEW
//
//  Created by 钱志新(平安科技快乐平安团队iOS开发组) on 2020/8/20.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_300 {
    //dp f(i,j) 表示当前i 能过得到的最大升序列
    // dp 方程 dp[i] = max(dp[i],dp[j] + 1)
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var res = 0, dp = [Int](repeating:1, count: nums.count)
        for i in 1 ..< nums.count {
            for j in 0 ..< i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
}
