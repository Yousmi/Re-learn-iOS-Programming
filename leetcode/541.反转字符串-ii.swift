/*
 * @lc app=leetcode.cn id=541 lang=swift
 *
 * [541] 反转字符串 II
 *
 * https://leetcode-cn.com/problems/reverse-string-ii/description/
 *
 * algorithms
 * Easy (53.24%)
 * Likes:    73
 * Dislikes: 0
 * Total Accepted:    15K
 * Total Submissions: 28.2K
 * Testcase Example:  '"abcdefg"\n2'
 *
 * 给定一个字符串 s 和一个整数 k，你需要对从字符串开头算起的每隔 2k 个字符的前 k 个字符进行反转。
 * 
 * 
 * 如果剩余字符少于 k 个，则将剩余字符全部反转。
 * 如果剩余字符小于 2k 但大于或等于 k 个，则反转前 k 个字符，其余字符保持原样。
 * 
 * 
 * 
 * 
 * 示例:
 * 
 * 输入: s = "abcdefg", k = 2
 * 输出: "bacdfeg"
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 该字符串只包含小写英文字母。
 * 给定字符串的长度和 k 在 [1, 10000] 范围内。
 * 
 * 
 */

// @lc code=start
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var temp = Array(s)
        for i in stride(from: 0, to: temp.count, by: 2 * k) {
            var l = i, r = min(temp.count - 1, i + k - 1)
            while l < r {
                temp.swapAt(l, r)
                l += 1
                r -= 1
            }
        }
        return String(temp)
    }

    func reverseStr_1(_ s: String, _ k: Int) -> String {
        guard k > 0 && s.count > 0 else {
            return s
        }
        var temp = Array(s)
        var start = 0
        while start < temp.count {
            if start + k - 1 < temp.count {
                reves(&temp, start, start + k - 1)
            } else {
                reves(&temp, start, temp.count - 1)
            }
            start = start + 2 * k
        }  
        return String(temp)
    }

    private func reves(_ temp: inout [Character], _ left: Int, _ right: Int) {
        var l = left, r = right
        while l < r {
            temp.swapAt(l,r)
            l += 1
            r -= 1
        }
    }
}
// @lc code=end

