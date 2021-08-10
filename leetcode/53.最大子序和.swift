/*
 * @lc app=leetcode.cn id=53 lang=swift
 *
 * [53] 最大子序和
 */

// @lc code=start
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var dp = nums
        var res = nums[0]
        for i in 1 ..< nums.count {
            dp[i] = max(dp[i - 1] + nums[i], nums[i])
            res = max(res, dp[i])
        }
        print(dp)
        return res
    }

    func maxSubArray_1(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var res = nums[0], sum = 0
        for i in nums {
            if sum > 0 {
                sum += i
            } else {
                sum = i
            }
            res = max(res, sum)
        }
        return res
    }
}
// @lc code=end

