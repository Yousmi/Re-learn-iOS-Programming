/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] Z 字形变换
 */

// @lc code=start
class Solution {
    //数组下标访问 O(1) 填充字符，
    func convert(_ s: String, _ numRows: Int) -> String {
        if s.count < 2 || numRows < 2 {
            return s
        }
        var store = [String](repeating: "", count: numRows)
        
        var strIndex = 0
        var shouldReturn = false
        for c in s {
            store[strIndex].append(c)
            strIndex = shouldReturn ?(strIndex - 1) : (strIndex + 1)
            if strIndex + 1 == numRows {
                shouldReturn = true
            }else if (strIndex == 0) {
                shouldReturn = false
            }
        }
        
        return store.joined()
    }
}
// @lc code=end

