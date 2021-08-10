/*
 * @lc app=leetcode.cn id=32 lang=swift
 *
 * [32] 最长有效括号
 *
 * https://leetcode-cn.com/problems/longest-valid-parentheses/description/
 *
 * algorithms
 * Hard (30.65%)
 * Likes:    840
 * Dislikes: 0
 * Total Accepted:    85.3K
 * Total Submissions: 257.7K
 * Testcase Example:  '"(()"'
 *
 * 给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
 * 
 * 示例 1:
 * 
 * 输入: "(()"
 * 输出: 2
 * 解释: 最长有效括号子串为 "()"
 * 
 * 
 * 示例 2:
 * 
 * 输入: ")()())"
 * 输出: 4
 * 解释: 最长有效括号子串为 "()()"
 * 
 * 
 */

// @lc code=start
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count > 1 else {
            return 0
        }
        var res = 0
        let temp = Array(s)
        var dp = Array(repeating: 0, count: s.count)                
        dp[0] = 0
        for i in 1 ..< temp.count {
            if temp[i] == ")" {
                if temp[i - 1] == "(" {
                    dp[i] = ((i >= 2) ? dp[i - 2] : 0) + 2
                } else if (i - dp[i - 1] - 1 >= 0 && temp[i - dp[i - 1] - 1] == "(") {
                    dp[i] = dp[i - 1] + ((i - dp[i - 1] >= 2) ? dp[i - dp[i - 1] - 2] : 0) + 2
                }
                res = max(res, dp[i])
            }
        }
        return res
    }
}
// @lc code=end

