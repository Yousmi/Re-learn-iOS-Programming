/*
 * @lc app=leetcode.cn id=231 lang=swift
 *
 * [231] 2的幂
 *
 * https://leetcode-cn.com/problems/power-of-two/description/
 *
 * algorithms
 * Easy (48.10%)
 * Likes:    234
 * Dislikes: 0
 * Total Accepted:    73.6K
 * Total Submissions: 151.7K
 * Testcase Example:  '1'
 *
 * 给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
 * 
 * 示例 1:
 * 
 * 输入: 1
 * 输出: true
 * 解释: 2^0 = 1
 * 
 * 示例 2:
 * 
 * 输入: 16
 * 输出: true
 * 解释: 2^4 = 16
 * 
 * 示例 3:
 * 
 * 输入: 218
 * 输出: false
 * 
 */

// @lc code=start
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var count = 0, n = n 
        while n > 0 {
            n &= (n - 1)
            count += 1
            if count > 1 {
                return false
            }
        }
        return count == 1
    }
}
// @lc code=end

