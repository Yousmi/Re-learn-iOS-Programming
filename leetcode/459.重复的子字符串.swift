/*
 * @lc app=leetcode.cn id=459 lang=swift
 *
 * [459] 重复的子字符串
 *
 * https://leetcode-cn.com/problems/repeated-substring-pattern/description/
 *
 * algorithms
 * Easy (47.75%)
 * Likes:    335
 * Dislikes: 0
 * Total Accepted:    46.4K
 * Total Submissions: 90.4K
 * Testcase Example:  '"abab"'
 *
 * 给定一个非空的字符串，判断它是否可以由它的一个子串重复多次构成。给定的字符串只含有小写英文字母，并且长度不超过10000。
 * 
 * 示例 1:
 * 
 * 
 * 输入: "abab"
 * 
 * 输出: True
 * 
 * 解释: 可由子字符串 "ab" 重复两次构成。
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: "aba"
 * 
 * 输出: False
 * 
 * 
 * 示例 3:
 * 
 * 
 * 输入: "abcabcabcabc"
 * 
 * 输出: True
 * 
 * 解释: 可由子字符串 "abc" 重复四次构成。 (或者子字符串 "abcabc" 重复两次构成。)
 * 
 * 
 */

// @lc code=start
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        guard s.count > 1 else {
            return false
        }
        let temp = Array(s), count = temp.count
        let end = temp.last!
        for i in 0 ..< count / 2 {
            if temp[i] == end {
                if count % (i + 1) != 0 {
                    continue
                }
                var j = i + 1, flag = true
                let subs = String(temp[0 ... i])
                while i + j < count {
                    let temps = String(temp[j ... i + j])
                    if temps != subs {
                        flag = false
                        break
                    }
                    j = (j + i) + 1
                }
                if flag {
                    return true
                }
            }
        }
        return false
    }
}
// @lc code=end

