/*
 * @lc app=leetcode.cn id=300 lang=swift
 *
 * [300] 最长上升子序列
 */

// @lc code=start
class Solution {
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
// @lc code=end

