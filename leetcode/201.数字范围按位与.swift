/*
 * @lc app=leetcode.cn id=201 lang=swift
 *
 * [201] 数字范围按位与
 *
 * https://leetcode-cn.com/problems/bitwise-and-of-numbers-range/description/
 *
 * algorithms
 * Medium (47.13%)
 * Likes:    209
 * Dislikes: 0
 * Total Accepted:    31.9K
 * Total Submissions: 62.8K
 * Testcase Example:  '5\n7'
 *
 * 给定范围 [m, n]，其中 0 <= m <= n <= 2147483647，返回此范围内所有数字的按位与（包含 m, n 两端点）。
 * 
 * 示例 1: 
 * 
 * 输入: [5,7]
 * 输出: 4
 * 
 * 示例 2:
 * 
 * 输入: [0,1]
 * 输出: 0
 * 
 */

// @lc code=start
class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var n = n 
        while n > m {
            n &= (n - 1)//依次把右边的1换成0
        }
        return n
    }
    func rangeBitwiseAnd_1(_ m: Int, _ n: Int) -> Int {
        var count = 0, n = n, m = m
        while m < n {//找公共前缀
            n = n >> 1
            m = m >> 1
            count += 1
        }
        return m << count
    }
}
// @lc code=end

