//
//  322.零钱兑换.swift
//  INTERVIEW
//
//  Created by 钱志新(平安科技快乐平安团队iOS开发组) on 2020/7/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_322 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard coins.count > 0 else {
            return -1
        }
        //dp[i] 表示 当目标金额为 i 时，至少需要 dp[i]个硬币
        //dp[i - coin]  表示 在金额为 i 时，兑换了 coin 后的金币数
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0 //base case
        for i in 0 ..< dp.count {
            for coin in coins {
                if (i - coin) < 0 {
                    continue
                }
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        if dp[amount] == amount + 1 {
            return -1
        }
        return dp[amount]
    }
}
