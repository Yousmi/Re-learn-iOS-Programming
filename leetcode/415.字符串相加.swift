/*
 * @lc app=leetcode.cn id=415 lang=swift
 *
 * [415] 字符串相加
 *
 * https://leetcode-cn.com/problems/add-strings/description/
 *
 * algorithms
 * Easy (49.99%)
 * Likes:    245
 * Dislikes: 0
 * Total Accepted:    70.7K
 * Total Submissions: 136.7K
 * Testcase Example:  '"0"\n"0"'
 *
 * 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * num1 和num2 的长度都小于 5100
 * num1 和num2 都只包含数字 0-9
 * num1 和num2 都不包含任何前导零
 * 你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式
 * 
 * 
 */

// @lc code=start
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        if num2.count > num1.count {
            return addStrings(num2, num1)
        }
        guard num1.count != 0 && num2.count != 0 else {
            return num1.count == 0 ? num2 : num1
        }
        var nums1 = Array(num1) //更长
        let nums2 = Array(num2) // 短一点的
        var i1 = nums1.count - 1, i2 = nums2.count - 1, carray = 0
        while i1 >= 0 {
            let v1 = nums1[i1].hexDigitValue ?? 0
            var v2 = 0
            if i2 >= 0 {
                v2 = nums2[i2].hexDigitValue ?? 0
            }
            let left = (v1 + v2 + carray) % 10
            carray = (v1 + v2 + carray) / 10
            nums1[i1] = Character("\(left)")
            i1 -= 1
            i2 -= 1
        }
        if carray > 0 {
            return String(carray) + String(nums1)
        }
        return String(nums1)
    }
}
// @lc code=end

