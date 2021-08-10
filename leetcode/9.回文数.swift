/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 */

// @lc code=start
class Solution {
    //思路 遍历一半的数据，， 原的一直减少，，新的一直增加，，退出条件是 原的 小于新的了
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }

        var temp = x, resv = 0
        while temp > resv {
            resv =  resv * 10 + temp % 10
            temp = temp / 10
        }

        return temp == resv || temp == resv / 10 //兼容 单、双个数
    }
}
// @lc code=end

