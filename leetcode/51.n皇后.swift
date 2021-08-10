/*
 * @lc app=leetcode.cn id=51 lang=swift
 *
 * [51] N皇后
 */

// @lc code=start
class Solution {
    var queens = [[Int]]()
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [Int](repeating: 0, count: n)
        DFS(0, &res)
        return printItems()
    }
    
    private func DFS(_ row: Int, _ current: inout [Int]) {
        if row == current.count {
            queens.append(current)
            return
        }
        for col in 0 ..< current.count {
            if isValid(col, row, &current) {
                continue
            }
            current[row] = col
            DFS(row + 1,  &current)
        }
    }
    
    private func isValid(_ col: Int, _ row: Int, _ current: inout [Int]) -> Bool {
        for i in 0 ..< row {
            if current[i] == col || current[i] + i == col + row || current[i] - i == col - row {
                return true
            }
        }
        return false
    }
    
    private func printItems() -> [[String]]{
        var res:[[String]] = []
        for i in queens {
            var strArr:[String] = []
            for j in i {
                var str = ""
                for k in 0 ..< i.count {
                    if k == j {
                        str += "Q"
                    }else{
                        str += "."
                    }
                }
                strArr.append(str)
            }
            res.append(strArr)
        }
        return res
    }
}
// @lc code=end

