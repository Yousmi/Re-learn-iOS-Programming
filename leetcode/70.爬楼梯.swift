/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 *
 * https://leetcode-cn.com/problems/climbing-stairs/description/
 *
 * algorithms
 * Easy (48.75%)
 * Likes:    1088
 * Dislikes: 0
 * Total Accepted:    226.5K
 * Total Submissions: 454.9K
 * Testcase Example:  '2'
 *
 * 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 * 
 * 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 * 
 * 注意：给定 n 是一个正整数。
 * 
 * 示例 1：
 * 
 * 输入： 2
 * 输出： 2
 * 解释： 有两种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶
 * 2.  2 阶
 * 
 * 示例 2：
 * 
 * 输入： 3
 * 输出： 3
 * 解释： 有三种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶 + 1 阶
 * 2.  1 阶 + 2 阶
 * 3.  2 阶 + 1 阶
 * 
 * 
 */

// @lc code=start
class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else {
            return n
        }
        var map = [Int: Int]()
        map[0] = 0
        map[1] = 1
        map[2] = 2
        for i in 3 ... n {
            map[i] = map[i - 1]! + map[i - 2]!
        }
        return map[n]!
    }

    func climbStairs_1(_ n: Int) -> Int {
        guard n > 2 else {
            return n
        }
        var fn_1 = 1, fn_2 = 2, fn_3 = 3
        for _ in 3...n {
            fn_3 = fn_2 + fn_1
            fn_1 = fn_2
            fn_2 = fn_3
        }
        return fn_3
        /*
        guard n > 1 else {
            return 1
        }
        
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        for i in 2...n {
            dp[i] =  dp[i-1] + dp[i - 2]
        }
        
        return dp[n]
        */
    }

    // MARK:- 递归 -2
    // func climbStairs_2(_ n: Int) -> Int {
    //     guard n > 1 else {
    //         return 0
    //     }
    //     var map = [Int: Int]()
    //     map[1] = 1
    //     map[2] = 2
    //     return _climbStairs_2(n, &map)
    // }
    // private func _climbStairs_2(_ n: Int, _ map: inout [Int: Int]) -> Int {
    //     if map[n] != nil {
    //         return map[n]!
    //     }
    //     map[n - 1] =  _climbStairs_2(n - 1, &map)
    //     map[n - 2] =  _climbStairs_2(n - 2, &map)
    //     return map[n - 1]! + map[n - 2]!
    // }

    /* O(n2) O(n)
    func climbStairs(_ n: Int) -> Int {
        
        var temp = [Int](repeating: 0, count: n + 1)//处理重复计算
        
        return _climbStairs(n, &temp)
    }
    
    private func _climbStairs(_ n: Int, _ a: inout [Int]) ->Int {
        a[1] = 1
        if n > 1 {
            a[2] = 2
            if n > 2 {
                for i in 3...n {
                    a[i] =  a[i-1] + a[i - 2]    
                }
            }
        }
        return a[n]
    }
    */
    
}
// @lc code=end

