//
//  121.买卖股票的最佳时机.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/15.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
/*
 每天的状态 buy sell rest
 sell 必须在 buy 之后， rest 分为2个状态 1、卖掉了 不操作(0)  2、买了 不操作(1)
 交易次数限制 k， 只有 k > 0 才能后续操作
 状态表 第一、 天数 二、交易最大次数  三、rest 状态
 dp[i][k][0] 表示 今天我没有股票  还可以交易 k 次
 解释：今天我没有持有股票，有两种可能：
 要么是我昨天就没有持有，然后今天选择 rest，所以我今天还是没有持有；
 要么是我昨天持有股票，但是今天我 sell 了，所以我今天没有持有股票了。
 dp[i][k][0]= max(选择 rest， 选择sell)
 
 dp[i][k][1] 表示 今天我还有股票  还可以交易 k 次
 解释：今天我持有着股票，有两种可能：
 要么我昨天就持有着股票，然后今天选择 rest，所以我今天还持有着股票；
 要么我昨天本没有持有，但今天我选择 buy，所以今天我就持有股票了。
 dp[i][k][1] = max(选择 rest, 选择buy)
 
 初始结果分析：
 dp[i][k][0] = dp[i][0][0] = 0
 dp[i][k][0] = dp[i][0][1] = Int.min
 */

class Solution_121 {
    func maxProfit(_ prices: [Int]) -> Int {
        
        if prices.count < 2 {
            return 0
        }
        var  dp = [[Int]]()
        
        for _ in 0 ..< prices.count {
            dp.append([0, 0])
        }
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1 ..< prices.count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], -prices[i])
        }
        return  dp[prices.count - 1][0]
    }
}
