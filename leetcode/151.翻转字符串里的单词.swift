/*
 * @lc app=leetcode.cn id=151 lang=swift
 *
 * [151] 翻转字符串里的单词
 *
 * https://leetcode-cn.com/problems/reverse-words-in-a-string/description/
 *
 * algorithms
 * Medium (42.36%)
 * Likes:    194
 * Dislikes: 0
 * Total Accepted:    79.3K
 * Total Submissions: 185.6K
 * Testcase Example:  '"the sky is blue"'
 *
 * 给定一个字符串，逐个翻转字符串中的每个单词。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入: "the sky is blue"
 * 输出: "blue is sky the"
 * 
 * 
 * 示例 2：
 * 
 * 输入: "  hello world!  "
 * 输出: "world! hello"
 * 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 * 
 * 
 * 示例 3：
 * 
 * 输入: "a good   example"
 * 输出: "example good a"
 * 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 * 
 * 
 * 
 * 
 * 说明：
 * 
 * 
 * 无空格字符构成一个单词。
 * 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 * 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 * 
 * 
 * 
 * 
 * 进阶：
 * 
 * 请选用 C 语言的用户尝试使用 O(1) 额外空间复杂度的原地解法。
 * 
 */

// @lc code=start
class Solution {

    func reverseWords(_ s: String) -> String {
        guard s.count > 0 else {
            return s
        }
        var temp = [[Character]]()
        temp.append([Character]())
        var indexT = 0
        for i in s.indices {
            if s[i] != " " {
                if indexT == temp.count {
                    temp.append([Character]())
                }
                temp[indexT].append(s[i])
            } else {
                if indexT < temp.count && temp[indexT].count > 0 {
                    indexT += 1
                }
            }
        }
        var i = 0
        indexT = temp.count - 1
        while i < indexT {
            temp.swapAt(i, indexT)
            i += 1
            indexT -= 1
        }
        return String(temp.joined(separator: " "))
    }
    
    func reverseWords_3(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }

    func reverseWords_2(_ s: String) -> String {
        var i = 0, j = 0
        var temp = [Character]()
        deleteSpace(s, &temp)

        reverse(&temp, 0, temp.count - 1)
        temp.append(" ")
        while i < temp.count {
            if temp[i] == " " {
                reverse(&temp, j, i - 1)
                j = i + 1
            }
            i += 1
        }
        temp.removeLast()
        return String(temp)
    }

    private func deleteSpace(_ s: String, _ res: inout [Character]) {
        let arr = Array(s)
        for i in 0 ..< arr.count {
            if arr[i] == " " {
                if res.last != nil && res.last! != " " {
                    res.append(" ")
                }
            } else {
                res.append(arr[i])
            }
        }
        if let last = res.last, last == " " {
            _ = res.removeLast()
        }
    }

    private func reverse(_ arr: inout [Character], _ left: Int, _ right: Int) {
        var left = left, right = right 
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
    func reverseWords_1(_ s: String) -> String {
        var tempArr = Array<Character>(" ")
        tempArr.append(contentsOf: s)
        tempArr.append(" ")
        reves(&tempArr)
        var res = "", item = [Character](), i = 0
        while i < tempArr.count {
            if tempArr[i] !=  " " {
                item.append(tempArr[i])
            } else if !item.isEmpty {
                reves(&item)
                res += String(item)
                res += " "
                item.removeAll()
            }
            i += 1
        }
        if res != "" {
            res.removeLast()
        }
        return res
    }
    
    private func reves(_ temp: inout [Character]) {
        var l = 0, r = temp.count - 1
        while l < r {
            temp.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}
// @lc code=end

