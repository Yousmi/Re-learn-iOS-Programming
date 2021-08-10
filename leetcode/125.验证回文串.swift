/*
 * @lc app=leetcode.cn id=125 lang=swift
 *
 * [125] 验证回文串
 *
 * https://leetcode-cn.com/problems/valid-palindrome/description/
 *
 * algorithms
 * Easy (43.94%)
 * Likes:    247
 * Dislikes: 0
 * Total Accepted:    141.4K
 * Total Submissions: 308.4K
 * Testcase Example:  '"A man, a plan, a canal: Panama"'
 *
 * 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 * 
 * 说明：本题中，我们将空字符串定义为有效的回文串。
 * 
 * 示例 1:
 * 
 * 输入: "A man, a plan, a canal: Panama"
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入: "race a car"
 * 输出: false
 * 
 * 
 */

// @lc code=start
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else {
            return true
        }
        let arr:[Character] = Array(s.lowercased())
        var l = 0, r = arr.count - 1 
        while l < r {
            while !(arr[l].isLetter || arr[l].isNumber) {
                l += 1
                if l == arr.count - 1 {
                    return true
                }
            }
            while r > 0 && !(arr[r].isLetter || arr[r].isNumber) {
                r -= 1
            }
            if arr[l] != arr[r]  {
                return false
            }
            l += 1
            r -= 1
        }

        return true
    }
}
// @lc code=end

