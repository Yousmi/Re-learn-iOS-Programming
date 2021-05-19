//
//  72.编辑距离.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/27.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_72 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1.count > 0 && word2.count > 0 else {
            return max(word1.count, word2.count)
        }
        let m = word1.count, n = word2.count
        let mArray = Array(word1), nArray = Array(word2)
        //dp[i][j] 表示单词1的前 i 个字符变换到 单词2 的前 j 个字符的最小步数
        // if i j字符相同 dp[i][j] = dp[i - 1][j - 1]
        // else 周围的最小值  + 1
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1 ... m {//列
            dp[i][0] = dp[i - 1][0] + 1
        }
        for j in 1 ... n {//行
            dp[0][j] = dp[0][j - 1] + 1
        }
        for i in 1 ... m {
            for j in 1 ... n {
                if mArray[i - 1] == nArray[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i][j - 1], dp[i - 1][j])) + 1
                }
            }
        }
        return dp[m][n]
    }

    func minDistance_1(_ word1: String, _ word2: String) -> Int {
        guard word1.count != 0 && word2.count != 0 else {
            return max(word1.count, word2.count)
        }
        let one = Array(word1), two = Array(word2)
        var dp = [[Int]](repeating:[Int](repeating:0, count:two.count + 1), count: one.count + 1)
        for i in 1 ... one.count {
            dp[i][0] = dp[i - 1][0] + 1
        }
        for j in 1 ... two.count {
            dp[0][j] = dp[0][j - 1] + 1
        }
        for i in 1 ... one.count {
            for j in 1 ... two.count {
                if one[i - 1] == two[j - 1] { //相同就看前一个字符的变换
                    dp[i][j] = dp[i - 1][j - 1]
                } else {//不同就是周围的最小值 + 1
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i][j - 1], dp[i - 1][j])) + 1
                }
            }
        }
        return dp[word1.count][word2.count]
    }
}
