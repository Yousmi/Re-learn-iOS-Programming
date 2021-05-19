//
//  32.最长有效括号.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/17.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_32 {

    func longestValidParentheses(_ s: String) -> Int {
        guard s.count > 1 else {
            return 0
        }
        var res = 0
        let temp = Array(s)
        var dp = Array(repeating: 0, count: s.count)
        dp[0] = 0
        for i in 1 ..< temp.count {
            if temp[i] == ")" {
                if temp[i - 1] == "(" {
                    dp[i] = ((i >= 2) ? dp[i - 2] : 0) + 2
                } else if (i - dp[i - 1] - 1 >= 0 && temp[i - dp[i - 1] - 1] == "(") {
                    dp[i] = dp[i - 1] + ((i - dp[i - 1] >= 2) ? dp[i - dp[i - 1] - 2] : 0) + 2
                }
                res = max(res, dp[i])
            }
        }
        return res
    }
}
