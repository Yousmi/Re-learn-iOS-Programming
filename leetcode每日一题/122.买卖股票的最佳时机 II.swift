//
//  122.买卖股票的最佳时机 II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/14.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_122 {
    func maxProfit(_ prices: [Int]) -> Int {
        var res = 0
        for i in 1 ..< prices.count {
            let temp = prices[i] - prices[i - 1]
            if temp > 0 {
                res += temp
            }
        }
        return res
    }
    
    func maxProfit_1(_ prices: [Int]) -> Int {
        var dp = [[Int]]()
        for _ in 0 ..< prices.count {
            dp.append([0, 0])
        }
        dp[0][0] = 0 //盈利
        dp[0][1] = -prices[0] //划掉了的
        for i in 1 ..< prices.count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
        }
        
        return dp[prices.count - 1][0]
    }
}
