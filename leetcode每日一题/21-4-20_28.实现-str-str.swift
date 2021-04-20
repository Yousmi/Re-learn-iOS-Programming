/*
 * @lc app=leetcode.cn id=28 lang=swift
 *
 * [28] 实现 strStr()
 *
 * https://leetcode-cn.com/problems/implement-strstr/description/
 *
 * algorithms
 * Easy (39.69%)
 * Likes:    505
 * Dislikes: 0
 * Total Accepted:    200.4K
 * Total Submissions: 504.5K
 * Testcase Example:  '"hello"\n"ll"'
 *
 * 实现 strStr() 函数。
 * 
 * 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置
 * (从0开始)。如果不存在，则返回  -1。
 * 
 * 示例 1:
 * 
 * 输入: haystack = "hello", needle = "ll"
 * 输出: 2
 * 
 * 
 * 示例 2:
 * 
 * 输入: haystack = "aaaaa", needle = "bba"
 * 输出: -1
 * 
 * 
 * 说明:
 * 
 * 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 * 
 * 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
 * 
 */

// @lc code=start
/**
*  非常常规的遍历方式
    1、只需要记住以下首次匹配到的位置
    2、首次匹配后遇到不匹配的需要重置回到上一次匹配到的下一个位置
*/
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {
            return 0
        }
        let hay = Array(haystack), nee = Array(needle)
        var i = 0, j = 0
        while i < hay.count && j < nee.count {
            if hay[i] == nee[j] {
                i += 1
                j += 1
            } else {
                i = i - j + 1 //这个就回去了
                j = 0
            }
        }
        if j == nee.count {
            return i - j
        }
        return -1
    }
    func strStr_1(_ haystack: String, _ needle: String) -> Int {
        let hLen = haystack.count
        let nLen = needle.count
        if nLen == 0 {return 0}
        if hLen < nLen { return -1}

        let offsetHold = hLen - nLen

        for i in 0...offsetHold {
            let stIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: i + nLen)

            if haystack[stIndex..<endIndex] == needle {
                return i
            }
        }
        return -1
    }
}
// @lc code=end

