//
//  62.不同路径.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_62 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let row = n, col = m
        var dp = Array(repeating: Array(repeating: 0, count: col), count: row)
        for i in 0 ..< row {
            for j in 0 ..< col {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[row - 1][col - 1]
    }

    func uniquePaths_1(_ m: Int, _ n: Int) -> Int {
        let rows = n , cols = m
        var dp = Array(repeating:Array(repeating:0, count: cols), count: rows)
        for i in 0 ..< rows {
            dp[i][0] = 1
        }
        for j in 0 ..< cols {
            dp[0][j] = 1
        }
        for i in 1 ..< rows {
            for j in 1 ..< cols {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[rows - 1][cols - 1]
    }
}
