/*
 * @lc app=leetcode.cn id=14 lang=swift
 *
 * [14] 最长公共前缀
 *
 * https://leetcode-cn.com/problems/longest-common-prefix/description/
 *
 * algorithms
 * Easy (37.33%)
 * Likes:    1107
 * Dislikes: 0
 * Total Accepted:    293.8K
 * Total Submissions: 766.8K
 * Testcase Example:  '["flower","flow","flight"]'
 *
 * 编写一个函数来查找字符串数组中的最长公共前缀。
 * 
 * 如果不存在公共前缀，返回空字符串 ""。
 * 
 * 示例 1:
 * 
 * 输入: ["flower","flow","flight"]
 * 输出: "fl"
 * 
 * 
 * 示例 2:
 * 
 * 输入: ["dog","racecar","car"]
 * 输出: ""
 * 解释: 输入不存在公共前缀。
 * 
 * 
 * 说明:
 * 
 * 所有输入只包含小写字母 a-z 。
 * 
 */

// @lc code=start
class Solution {
    //利用sorted()函数减少遍历时间 也可以用 strs.min(), strs.max()
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        var res = ""
        let tempArr = Array(strs.max()!)
        for (i, c) in strs.min()!.enumerated() {
            if c == tempArr[i] {
                res += String(c)
            } else {
                break
            }
        }
        return res
    }
    /*
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        let sorted = strs.sorted()
        return getCommonPre(sorted.first!, sorted.last!)
    }

    
    private func getCommonPre(_ str1: String, _ str2: String) -> String {
        let minStr = str1.count > str2.count ? str2 : str1
        let maxStr = str1.count > str2.count ? str1 : str2
        let tempArr = Array(maxStr)
        var idex = -1
        for (i, c) in minStr.enumerated() {
            if c == tempArr[i] {
                idex = i
            } else {
                break
            }
        }
        return idex != -1 ? String(tempArr[0...idex]) : ""
    }
    */
}
// @lc code=end

