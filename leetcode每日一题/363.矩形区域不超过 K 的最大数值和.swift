//
//  363. 矩形区域不超过 K 的最大数值和.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/1.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_363 {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let row = matrix.count, col = matrix[0].count
        var res = Int.min
        for l in 0 ..< col {
            var rowSum = [Int]()
            for r in l ..< col {
                for i in 0 ..< row {
                    rowSum.append(matrix[i][r])
                }
                res = max(res, dpmax(rowSum, k))
                if res == k {
                    return res
                }
            }
        }
        return res
    }
    
    private func dpmax(_ arr: [Int], _ k: Int) -> Int {
        var rollSum = arr[0], rollMax = rollSum
        for i in 1 ..< arr.count {
            if rollSum > 0{
                rollSum += arr[i]
            } else {
                rollSum = arr[i]
            }
            if rollSum > rollMax {
                rollMax = rollSum
            }
        }
        if (rollMax <= k) {
            return rollMax
        }
        var res = Int.min
        for l in 0 ..< arr.count {
            var sum = 0
            for r in l ..< arr.count {
                sum += arr[r]
                if (sum > res && sum <= k) {
                    res = sum
                }
                if res == k {
                    return k
                }
            }
        }
        return res
    }
    
    //超时
    /*
    func maxSumSubmatrix_1(_ matrix: [[Int]], _ k: Int) -> Int {
        let rows = matrix.count, cols = matrix[0].count
        var res = Int.min
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols + 1), count: rows + 1)
        for r1 in 1 ..< rows {
            for c1 in 1 ..< cols {
                dp[r1][c1] = matrix[r1 - 1][c1 - 1]
                for r2 in r1 ..< rows {
                    for c2 in c1 ..< cols {
                        dp[r2][c2] = dp[r2 - 1][c2] + dp[r2][c2 - 1] - dp[r2 - 1][c2 - 1] + matrix[r2 - 1][c2 - 1];
                        if (dp[r2][c2] <= k && dp[r2][c2] > res) {
                            res = dp[r2][c2]
                        }
                    }
                }
            }
        }
        return res
    }
     */
}
