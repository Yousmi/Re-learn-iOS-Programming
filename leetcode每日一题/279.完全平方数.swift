//
//  279.完全平方数.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/11.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_279 {
    func numSquares(_ n: Int) -> Int {
        //dp[i]: 表示 当前 i 的最大的平方根的和  ，全部是 1， 即 i
        var dp = [Int](repeating: n, count: n + 1)
        dp[0] = 0
        for i in 1 ... n {
            dp[i] = i
            var j = 1
            while i - j * j >= 0 {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }
        return dp[n]
    }
}
