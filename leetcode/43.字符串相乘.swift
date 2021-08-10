/*
 * @lc app=leetcode.cn id=43 lang=swift
 *
 * [43] 字符串相乘
 *
 * https://leetcode-cn.com/problems/multiply-strings/description/
 *
 * algorithms
 * Medium (42.32%)
 * Likes:    451
 * Dislikes: 0
 * Total Accepted:    96.5K
 * Total Submissions: 217.9K
 * Testcase Example:  '"2"\n"3"'
 *
 * 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 * 
 * 示例 1:
 * 
 * 输入: num1 = "2", num2 = "3"
 * 输出: "6"
 * 
 * 示例 2:
 * 
 * 输入: num1 = "123", num2 = "456"
 * 输出: "56088"
 * 
 * 说明：
 * 
 * 
 * num1 和 num2 的长度小于110。
 * num1 和 num2 只包含数字 0-9。
 * num1 和 num2 均不以零开头，除非是数字 0 本身。
 * 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 * 
 * 
 */

// @lc code=start
class Solution {
    //该算法是通过两数相乘时，乘数某位与被乘数某位相乘，与产生结果的位置的规律来完成。具体规律如下：
    // - 乘数 num1 位数为 MM，被乘数 num2 位数为 NN， num1 x num2 结果 res 最大总位数为 M+N
    // - num1[i] x num2[j] 的结果为 tmp(位数为两位，"0x","xy"的形式)，其第一位位于 res[i+j]，第二位位于 res[i+j+1]。

    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        var res = [Int](repeating:0, count: num1.count + num2.count)
        let arr1 = [Character](num1), arr2 = [Character](num2)
        var i1 = arr1.count - 1
        while i1 >= 0 {
            let in1 = Int(String(arr1[i1])) ?? 0
            var i2 = arr2.count - 1
            while i2 >= 0 {
                let in2 = Int(String(arr2[i2])) ?? 0
                let sum = (res[i1 + i2 + 1] + in1 * in2)
                res[i1 + i2 + 1] = sum % 10
                res[i1 + i2] += sum / 10
                i2 -= 1
            }
            i1 -= 1
        }
        var rest = ""
        for i in 0..<res.count {
            if i == 0 && res[i] == 0 {
                continue
            } 
            rest += String(res[i])
        }
        return rest
    }
}
// @lc code=end

