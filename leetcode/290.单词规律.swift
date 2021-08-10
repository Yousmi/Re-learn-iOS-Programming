/*
 * @lc app=leetcode.cn id=290 lang=swift
 *
 * [290] 单词规律
 *
 * https://leetcode-cn.com/problems/word-pattern/description/
 *
 * algorithms
 * Easy (42.74%)
 * Likes:    174
 * Dislikes: 0
 * Total Accepted:    28K
 * Total Submissions: 64.9K
 * Testcase Example:  '"abba"\n"dog cat cat dog"'
 *
 * 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。
 * 
 * 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。
 * 
 * 示例1:
 * 
 * 输入: pattern = "abba", str = "dog cat cat dog"
 * 输出: true
 * 
 * 示例 2:
 * 
 * 输入:pattern = "abba", str = "dog cat cat fish"
 * 输出: false
 * 
 * 示例 3:
 * 
 * 输入: pattern = "aaaa", str = "dog cat cat dog"
 * 输出: false
 * 
 * 示例 4:
 * 
 * 输入: pattern = "abba", str = "dog dog dog dog"
 * 输出: false
 * 
 * 说明:
 * 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。    
 * 
 */

// @lc code=start
class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let strArray = str.split(separator:" ")
        let patArray = pattern.map({return String($0)})
        guard strArray.count == patArray.count else {
            return false
        }
        var map_1 = [Substring: String]()
        var map_2 = [String : Substring]()
        for (i, stg) in patArray.enumerated() {
            let sub = strArray[i]
            if let pc = map_1[sub], pc != stg {
                return false
            } else if let pc = map_2[stg], pc != sub   {
                return false
            } else {
                map_1[sub] = stg
                map_2[stg] = sub
            }
        }
        
        return true
    }

    func wordPattern_1(_ pattern: String, _ str: String) -> Bool {
        guard str.count > 1 && pattern.count > 0 else {
            return pattern.count == str.count
        }
        let strArray = str.split(separator: " ")
        let patArray = pattern.map { return String($0) }
        guard strArray.count ==  pattern.count else {
            return false
        }
        var dict = [String : Substring]()
        for (index, value) in patArray.enumerated() {
            if dict.keys.contains(value) {
                if dict[value] != strArray[index] {
                    return false
                }
            } else {
                if dict.values.contains(strArray[index]) {
                    return false
                }
                dict[value] = strArray[index]
            }
        }
        return true
    }
}
// @lc code=end

