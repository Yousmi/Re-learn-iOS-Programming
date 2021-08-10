/*
 * @lc app=leetcode.cn id=343 lang=swift
 *
 * [343] 整数拆分
 *
 * https://leetcode-cn.com/problems/integer-break/description/
 *
 * algorithms
 * Medium (56.00%)
 * Likes:    350
 * Dislikes: 0
 * Total Accepted:    57.6K
 * Total Submissions: 98.2K
 * Testcase Example:  '2'
 *
 * 给定一个正整数 n，将其拆分为至少两个正整数的和，并使这些整数的乘积最大化。 返回你可以获得的最大乘积。
 * 
 * 示例 1:
 * 
 * 输入: 2
 * 输出: 1
 * 解释: 2 = 1 + 1, 1 × 1 = 1。
 * 
 * 示例 2:
 * 
 * 输入: 10
 * 输出: 36
 * 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
 * 
 * 说明: 你可以假设 n 不小于 2 且不大于 58。
 * 
 */

// @lc code=start
class Solution {
    //自底向上
    func integerBreak(_ n: Int) -> Int {
        var dp = Array(repeating: 1, count: n + 1)
        if n > 2 {
            for i in 3 ... n {
                for j in 1 ..< i {
                    dp[i] = max(dp[i], max(j * dp[i - j], j * (i - j)))
                }
            }
        }
        return dp[n]
    }
    
    //自顶上下
    func integerBreak_2(_ n: Int) -> Int {
        var map = [Int: Int]()
        return integerRecursion(n, &map)
    }
    private func integerRecursion(_ n: Int, _ map: inout [Int: Int]) -> Int {
        if n == 2 {
            return 1
        }
        if map[n] != nil {
            return map[n]!
        }
        var res = 0
        for i in 1 ..< n {
            res = max(res, max(i * integerRecursion(n - i, &map), i * (n - i)))
        }
        map[n] = res
        return res
    }
    //数学归纳
    func integerBreak_1(_ n: Int) -> Int {
        if n <= 3 {
            return n - 1
        }
        let a: Double = Double(n / 3), b: Double = Double(n % 3)
        let third: Double = 3.0
        if b == 0 {
            return Int(pow(third, a))
        }
        if b == 1 {
            return Int(pow(third, a - 1.00) * (2 + 2))
        }
        if b == 2 {
            return Int((pow(third, a) * 2))
        }
        return 0
    }
}
// @lc code=end

