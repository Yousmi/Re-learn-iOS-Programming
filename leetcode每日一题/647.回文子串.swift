//
//  647.回文子串.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/19.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。

//具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被计为是不同的子串。
import Foundation

class Solution_647 {
    func countSubstrings(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        var temp = Array(s), res = 0
        for i in 0 ..< (2 * temp.count) - 1 {
            var left = i / 2, right = left + i % 2
            while left >= 0 && right < temp.count && temp[left] == temp[right] {
                res += 1
                left -= 1
                right += 1
            }
        }
        return res
    }
    
    func countSubstrings_1(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        let temp = Array(s)
        var dp = [[Bool]](repeating:[Bool](repeating:false, count:s.count), count: s.count)
        var res = 0
        for col in 0 ..< s.count {
            for row in 0 ... col {
                if row == col { //单个字符
                    dp[row][col] = true
                } else if (temp[row] == temp[col] && col - row == 1) { //2个字符串
                    dp[row][col] = true
                } else if col - row > 1 && temp[row] == temp[col] && dp[row + 1][col - 1] {
                    dp[row][col] = true
                }
                if dp[row][col] {
                    res += 1
                }
            }
        }
        return res
    }
}
