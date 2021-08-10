/*
 * @lc app=leetcode.cn id=22 lang=swift
 *
 * [22] 括号生成
 *
 * https://leetcode-cn.com/problems/generate-parentheses/description/
 *
 * algorithms
 * Medium (75.37%)
 * Likes:    1019
 * Dislikes: 0
 * Total Accepted:    126.6K
 * Total Submissions: 167.9K
 * Testcase Example:  '3'
 *
 * 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：n = 3
 * 输出：[
 * ⁠      "((()))",
 * ⁠      "(()())",
 * ⁠      "(())()",
 * ⁠      "()(())",
 * ⁠      "()()()"
 * ⁠    ]
 * 
 * 
 */

// @lc code=start
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return []
        }
        var res = [String]()
        func generate(_ str: String, _ zuo: Int, _ you: Int) {
            if str.count == n * 2 {
                res.append(str)
                return 
            }
            if zuo < n {
                generate(str + "(", zuo + 1, you)
            }
            if zuo > you {
                generate(str + ")", zuo, you + 1)
            }
        }
        generate("", 0 , 0)
        return res
    }
    func generateParenthesis_1(_ n: Int) -> [String] {
        var res = [String]()
        _generate(&res, "", 0, 0, n)
        return res
    }

    private func _generate(_ res: inout [String], _ s: String, _ l: Int, _ r: Int, _ n: Int) {
        if l == n && r == n {
            res.append(s)
            return 
        }
        if l < n {
            _generate(&res, s + "(", l + 1, r, n)
        }
        if l > r {
            _generate(&res, s + ")", l, r + 1, n)
        }
    }
}
// @lc code=end

