/*
 * @lc app=leetcode.cn id=66 lang=swift
 *
 * [66] 加一
 *
 * https://leetcode-cn.com/problems/plus-one/description/
 *
 * algorithms
 * Easy (44.25%)
 * Likes:    487
 * Dislikes: 0
 * Total Accepted:    166.8K
 * Total Submissions: 375.4K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 * 
 * 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
 * 
 * 你可以假设除了整数 0 之外，这个整数不会以零开头。
 * 
 * 示例 1:
 * 
 * 输入: [1,2,3]
 * 输出: [1,2,4]
 * 解释: 输入数组表示数字 123。
 * 
 * 
 * 示例 2:
 * 
 * 输入: [4,3,2,1]
 * 输出: [4,3,2,2]
 * 解释: 输入数组表示数字 4321。
 * 
 * 
 */

// @lc code=start
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var res = digits
        var nextup = 1
        var sum = 0
        for i in 0..<digits.count {
            let last = digits.count - 1 - i
            sum = res[last] + nextup
            res[last] = sum % 10
            nextup = sum / 10
        }
        
        if nextup > 0 {
            res.insert(1, at: 0)
        }
        
        return res
        /*
        guard digits.count > 0 else {
            return [1]
        }
        var res = [Int]()
        var j = digits.count - 1
        var shouldUp = false
        var nextup = 1
        
        while j >= 0 {
            let i = digits[j]
            let n = (i + nextup) / 10
            let m = (i + nextup) % 10
            if n > 0 {
                shouldUp = true
                res.insert(m, at: 0)
                nextup = n
            } else {
                shouldUp = false
                res.insert(i + nextup, at: 0)
                nextup = 0
            }
            
            j -= 1
        }
        
        if shouldUp {
            res.insert(1, at: 0)
        }
        
        return res
        */
    }
}
// @lc code=end

