//
//  322. 零钱兑换.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_322 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        //dp [i] : 表示当前总额最多需要多少硬币
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        //base case
        dp[0] = 0
        for coin in coins {
            if amount >= coin { //直接处理较大的就行了
                for i in coin ... amount {
                    if i - coin >= 0 {
                        dp[i] = min(dp[i], dp[i - coin] + 1)
                    }
                }
            }
        }
        
        if dp[amount] == amount + 1 {
            return -1
        }
        return dp[amount]
    }
    
    func coinChange_1(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        //dp [i] : 表示当前总额最多需要多少硬币
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        //base case
        dp[0] = 0
        for i in 1 ... amount {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        if dp[amount] == amount + 1 {
            return -1
        }
        return dp[amount]
    }
}
