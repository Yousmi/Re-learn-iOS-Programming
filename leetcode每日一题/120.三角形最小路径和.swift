//
//  120.三角形最小路径和.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_120 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        var dp = triangle, i = triangle.count - 2
        while i >= 0 {
            for j in 0 ..< triangle[i].count {
                dp[i][j] += min(dp[i + 1][j], dp[i + 1][j + 1])
            }
            i -= 1
        }
        return dp[0][0]
    }
    
    func minimumTotal_1(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        var dp = triangle
        for i in 1 ..< triangle.count {
            let pre = triangle[i - 1], cur = triangle[i]
            for j in 0 ..< cur.count  {
                if j == 0 {
                    dp[i][j] = dp[i - 1][j]
                } else if j >= pre.count {
                    dp[i][j] = dp[i - 1][pre.count - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j])
                }
                dp[i][j] += triangle[i][j]
            }
        }
        return dp[triangle.count - 1].min()!
    }
}
