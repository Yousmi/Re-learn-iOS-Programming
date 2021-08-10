/*
 * @lc app=leetcode.cn id=69 lang=swift
 *
 * [69] x 的平方根
 */

// @lc code=start
class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {
            return x
        }
        var left = 0, right = x
        while left < right {
            let mid = left + (right - left) / 2 + 1
            if mid * mid > x {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}
// @lc code=end

