/*
 * @lc app=leetcode.cn id=279 lang=swift
 *
 * [279] 完全平方数
 *
 * https://leetcode-cn.com/problems/perfect-squares/description/
 *
 * algorithms
 * Medium (56.34%)
 * Likes:    516
 * Dislikes: 0
 * Total Accepted:    74.3K
 * Total Submissions: 130.3K
 * Testcase Example:  '12'
 *
 * 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
 * 
 * 示例 1:
 * 
 * 输入: n = 12
 * 输出: 3 
 * 解释: 12 = 4 + 4 + 4.
 * 
 * 示例 2:
 * 
 * 输入: n = 13
 * 输出: 2
 * 解释: 13 = 4 + 9.
 * 
 */

// @lc code=start
class Solution {
    func numSquares(_ n: Int) -> Int {
        guard  n > 0 else {
            return n
        }
        var dp = Array(repeating: 0, count: n + 1)
        for i in 1 ... n {
            dp[i] = i
            for j in 0 ..< i {
                if i - j * j >= 0 {
                    dp[i] = min(dp[i], dp[i - j * j] + 1)
                } else {
                    break
                }
            }
        }
        return dp[n]
    }
}
// @lc code=end

