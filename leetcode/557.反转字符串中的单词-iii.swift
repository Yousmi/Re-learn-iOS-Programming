/*
 * @lc app=leetcode.cn id=557 lang=swift
 *
 * [557] 反转字符串中的单词 III
 *
 * https://leetcode-cn.com/problems/reverse-words-in-a-string-iii/description/
 *
 * algorithms
 * Easy (70.77%)
 * Likes:    207
 * Dislikes: 0
 * Total Accepted:    68.1K
 * Total Submissions: 95.5K
 * Testcase Example:  `"Let's take LeetCode contest"`
 *
 * 给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。
 * 
 * 示例 1:
 * 
 * 
 * 输入: "Let's take LeetCode contest"
 * 输出: "s'teL ekat edoCteeL tsetnoc" 
 * 
 * 
 * 注意：在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。
 * 
 */

// @lc code=start
class Solution {
    func reverseWords(_ s: String) -> String {
        var i = 0
        var sarr = Array(s)
        sarr.append(" ")
        for j in 0 ..< sarr.count{
            if sarr[j] == " " {
                reverse(&sarr, i, j - 1)
                i = j+1
            } 
        }
        sarr.removeLast()
        return String(sarr)
    }
    
    private func reverse(_ arr: inout [Character], _ left: Int, _ right: Int) {
        var left = left, right = right
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    /*
    func reverseWords(_ s: String) -> String {
        guard s.count > 0 else {
            return s
        }
        var arr:[Character] = Array(s)
        arr.append(" ")
        var res = [Character](), result = ""
        var left = 0
        while left < arr.count {
            if arr[left] == " " {
                if res.count > 0 {
                    swap(&res)
                    result += String(res)
                    res.removeAll()
                }
                if left != arr.count - 1 {
                    result += String(arr[left])
                }
            } else {
                res.append(arr[left])
            }
            
            left += 1
        }
        return result
    }
    
    private func swap(_ arr: inout [Character]) {
        var left = 0, right = arr.count - 1
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    */
}
// @lc code=end

