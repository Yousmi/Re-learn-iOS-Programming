/*
 * @lc app=leetcode.cn id=405 lang=swift
 *
 * [405] 数字转换为十六进制数
 */

// @lc code=start
class Solution {
    private let map = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
    func toHex(_ num: Int) -> String {
        if num == 0 {
            return "0"
        }
        var res = ""
        dfs(num, &res, 0)
        return res
    }

    private func dfs(_ num: Int, _ res: inout String, _ count: Int) {
        if num == 0  || count == 8 {
            return
        }
        res = map[num & 15] + res
        dfs(num >> 4, &res, count + 1)
    }
}
// @lc code=end

