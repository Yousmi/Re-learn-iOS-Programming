//
//  343.整数拆分.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_343 {
    //自底向上
    func integerBreak(_ n: Int) -> Int {
        var dp = Array(repeating: 1, count: n + 1)
        if n > 2 {
            for i in 3 ... n {
                for j in 1 ..< i {
                    dp[i] = max(dp[i], max(j * dp[i - j], j * (i - j)))
                }
            }
        }
        return dp[n]
    }
    
    //自顶上下
    func integerBreak_2(_ n: Int) -> Int {
        var map = [Int: Int]()
        return integerRecursion(n, &map)
    }
    private func integerRecursion(_ n: Int, _ map: inout [Int: Int]) -> Int {
        if n == 2 {
            return 1
        }
        if map[n] != nil {
            return map[n]!
        }
        var res = 0
        for i in 1 ..< n {
            res = max(res, max(i * integerRecursion(n - i, &map), i * (n - i)))
        }
        map[n] = res
        return res
    }
    //数学归纳
    func integerBreak_1(_ n: Int) -> Int {
        if n <= 3 {
            return n - 1
        }
        let a: Double = Double(n / 3), b: Double = Double(n % 3)
        let third: Double = 3.0
        if b == 0 {
            return Int(pow(third, a))
        }
        if b == 1 {
            return Int(pow(third, a - 1.00) * (2 + 2))
        }
        if b == 2 {
            return Int((pow(third, a) * 2))
        }
        return 0
    }
}
