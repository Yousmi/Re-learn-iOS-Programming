/*
 * @lc app=leetcode.cn id=322 lang=swift
 *
 * [322] 零钱兑换
 *
 * https://leetcode-cn.com/problems/coin-change/description/
 *
 * algorithms
 * Medium (39.73%)
 * Likes:    728
 * Dislikes: 0
 * Total Accepted:    113.7K
 * Total Submissions: 279.6K
 * Testcase Example:  '[1,2,5]\n11'
 *
 * 给定不同面额的硬币 coins 和一个总金额
 * amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入: coins = [1, 2, 5], amount = 11
 * 输出: 3 
 * 解释: 11 = 5 + 5 + 1
 * 
 * 示例 2:
 * 
 * 输入: coins = [2], amount = 3
 * 输出: -1
 * 
 * 
 * 
 * 说明:
 * 你可以认为每种硬币的数量是无限的。
 * 
 */

// @lc code=start
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        //dp [i] : 表示当前总额最多需要多少硬币
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        //base case
        dp[0] = 0
        for coin in coins {
            if amount >= coin { //直接处理较大的就行了
                for i in coin ... amount {
                    if i - coin >= 0 {
                        dp[i] = min(dp[i], dp[i - coin] + 1)
                    }
                }
            }
        }
        
        if dp[amount] == amount + 1 {
            return -1
        }
        return dp[amount]
    }
    
    func coinChange_1(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        //dp [i] : 表示当前总额最多需要多少硬币
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        //base case
        dp[0] = 0
        for i in 1 ... amount {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        if dp[amount] == amount + 1 {
            return -1
        }
        return dp[amount]
    }
}
// @lc code=end

