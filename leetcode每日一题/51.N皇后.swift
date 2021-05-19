//
//  51.N皇后.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/28.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_51 {
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
