/*
 * @lc app=leetcode.cn id=412 lang=swift
 *
 * [412] Fizz Buzz
 *
 * https://leetcode-cn.com/problems/fizz-buzz/description/
 *
 * algorithms
 * Easy (63.72%)
 * Likes:    67
 * Dislikes: 0
 * Total Accepted:    40.5K
 * Total Submissions: 63.2K
 * Testcase Example:  '1'
 *
 * 写一个程序，输出从 1 到 n 数字的字符串表示。
 * 
 * 1. 如果 n 是3的倍数，输出“Fizz”；
 * 
 * 2. 如果 n 是5的倍数，输出“Buzz”；
 * 
 * 3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。
 * 
 * 示例：
 * 
 * n = 15,
 * 
 * 返回:
 * [
 * ⁠   "1",
 * ⁠   "2",
 * ⁠   "Fizz",
 * ⁠   "4",
 * ⁠   "Buzz",
 * ⁠   "Fizz",
 * ⁠   "7",
 * ⁠   "8",
 * ⁠   "Fizz",
 * ⁠   "Buzz",
 * ⁠   "11",
 * ⁠   "Fizz",
 * ⁠   "13",
 * ⁠   "14",
 * ⁠   "FizzBuzz"
 * ]
 * 
 * 
 */

// @lc code=start
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var res = [String]()
        for i in 1 ... n {
            var resItem = ""
            let san = i % 3 
            let wu = i % 5
            if  san == 0 || wu == 0 {
                resItem = san == 0 ? "Fizz" : "Buzz"
                resItem = (san == 0 && wu == 0) ? "FizzBuzz" : resItem
            } else {
                resItem = String(i)
            }
            res += [resItem]
        }
        return res
    }
}
// @lc code=end

