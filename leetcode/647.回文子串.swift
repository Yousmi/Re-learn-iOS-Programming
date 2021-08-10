/*
 * @lc app=leetcode.cn id=647 lang=swift
 *
 * [647] 回文子串
 *
 * https://leetcode-cn.com/problems/palindromic-substrings/description/
 *
 * algorithms
 * Medium (61.46%)
 * Likes:    239
 * Dislikes: 0
 * Total Accepted:    26.2K
 * Total Submissions: 42.7K
 * Testcase Example:  '"abc"'
 *
 * 给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。
 * 
 * 具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被计为是不同的子串。
 * 
 * 示例 1:
 * 
 * 
 * 输入: "abc"
 * 输出: 3
 * 解释: 三个回文子串: "a", "b", "c".
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: "aaa"
 * 输出: 6
 * 说明: 6个回文子串: "a", "a", "a", "aa", "aa", "aaa".
 * 
 * 
 * 注意:
 * 
 * 
 * 输入的字符串长度不会超过1000。
 * 
 * 
 */

// @lc code=start
class Solution {
    func countSubstrings(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        var temp = Array(s), res = 0
        for i in 0 ..< (2 * temp.count) - 1 {
            var left = i / 2, right = left + i % 2
            while left >= 0 && right < temp.count && temp[left] == temp[right] {
                res += 1
                left -= 1
                right += 1
            }
        }
        return res
    }

    func countSubstrings_1(_ s: String) -> Int { 
        guard s.count > 0 else {
            return 0
        }
        let temp = Array(s)
        var dp = [[Bool]](repeating:[Bool](repeating:false, count:s.count), count: s.count)
        var res = 0
        for col in 0 ..< s.count {
            for row in 0 ... col {
                if row == col { //单个字符
                    dp[row][col] = true
                } else if (temp[row] == temp[col] && col - row == 1) { //2个字符串
                    dp[row][col] = true
                }
                //上一个字符也是回文串 dp[i][j] 表示区间范围[i,j] （左闭右闭）的子串是否是回文子串
                else if col - row > 1 && temp[row] == temp[col] && dp[row + 1][col - 1] {
                    dp[row][col] = true
                }
                if dp[row][col] {
                    res += 1
                }
            }
        }
        return res
    }
}
// @lc code=end

