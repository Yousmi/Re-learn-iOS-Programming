/*
 * @lc app=leetcode.cn id=8 lang=swift
 *
 * [8] 字符串转换整数 (atoi)
 */

// @lc code=start
class Solution {
    func myAtoi(_ str: String) -> Int {

        let  arr = Array(str)
        var res = 0
        var i = 0
        while i < arr.count && arr[i] == " "  {
            i += 1
        }
        if i == arr.count {//全是空格
            return res;
        }
        
        var isOver1 = true //符号标志
        if  arr[i] == Character("-") {
            isOver1 = false
            i += 1
        }
        else  if (arr[i] == Character("+")) {
            i += 1
        }
        else if !isDigit(arr[i]) {
            return res
        }
        
        while i <  arr.count && isDigit(arr[i]) {
            let char_i =  arr[i]
            
            let pop: Int = char_i.wholeNumberValue ?? 0
            
            if (res > Int32.max / 10) || (res == Int32.max / 10 && pop > 7) {
                return isOver1 ? Int(Int32.max) : Int(Int32.min)
            }
            
            res = res * 10 + pop
            i += 1
        }
        return isOver1 ? res : -res
    }
    
    func isDigit(_ s: Character) -> Bool {
        return s == "0" || s == "1" || s == "2" || s == "3" || s == "4" || s == "5" || s == "6" || s == "7" || s == "8" || s == "9"
    }
}
// @lc code=end

