//
//  1143.最长公共子序列.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/25.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
class Solution_1143 {
    
    //这是动态规划最难的一步，不过好在这种字符串问题的套路都差不多，权且借这道题来聊聊处理这类问题的思路。
    //状态转移说简单些就是做选择，比如说这个问题，是求 s1 和 s2 的最长公共子序列，不妨称这个子序列为 lcs。那么对于 s1 和 s2 中的每个字符，有什么选择？很简单，两种选择，要么在 lcs 中，要么不在。
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        let temp1 = Array(text1), temp2 = Array(text2)
        for i in 1 ... temp1.count {
            for j in 1 ... temp2.count {
                if temp1[i - 1] == temp2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[text1.count][text2.count]
    }
    
    //超时
    func longestCommonSubsequence_1(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        let res = dfs(text1, text1.count - 1, text2, text2.count - 1)
        return res
    }

    private func dfs(_ text1:[Character], _ i: Int, _ text2: [Character], _ j: Int) -> Int {
        if i == -1 || j == -1 {
            return 0
        }
        if text1[i] == text2[j] {
            return dfs(text1, i - 1, text2, j - 1) + 1
        } else {
            return max(dfs(text1, i - 1, text2, j), dfs(text1, i, text2, j - 1))
        }
    }
    
    
}
