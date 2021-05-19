//
//  354. 俄罗斯套娃信封问题.swift
//  INTERVIEW
//
//  Created by Scan on 2021/3/4.
//  Copyright © 2021 钱志新. All rights reserved.
//

import Foundation

//给你一个二维整数数组 envelopes ，其中 envelopes[i] = [wi, hi] ，表示第 i 个信封的宽度和高度。
//
//当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。
//
//请计算 最多能有多少个 信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。
//
//注意：不允许旋转信封。


class Solution_354 {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 0 else {
            return 0
        }
        var env = envelopes
        env.sort(by:{(i, j) -> Bool in
            return i[0] < j[0] || (i[0] == j[0] && i[1] > j[1])
        })
        var dp = [Int](repeating:0, count:env.count)
        var res = 0
        for item in env {
            var left = 0, right = res
            while left < right {
                let mid = left + (right - left) >> 1
                if dp[mid] < item[1] {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            dp[left] = item[1]
            if res == left {
                res += 1
            }
        }
        return res
    }
    
    func maxEnvelopes_2(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 0 else {
            return 0
        }
        var env = envelopes
        env.sort(by: { (i, j) -> Bool in
            return i[0] < j[0] || (i[0] == j[0] && i[1] > j[1])
        })
        var arr = Array(arrayLiteral: env[0][1])
        
        func binary(_ target: Int) -> Int {
            var left = 0, right = arr.count - 1
            while left < right {
                let mid = left + (right - left) >> 1
                let tem = arr[mid]
                if tem < target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }
        
        for i in 1 ..< env.count {
            let tar = env[i][1]
            if tar > arr.last! {
                arr.append(tar)
            } else {
                let idx = binary(tar)
                arr[idx] = tar
            }
        }
        return arr.count
    }
    
    func maxEnvelopes_1(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 0 else {
            return 0
        }
        var dp = [Int](repeating: 1, count: envelopes.count)
        var env = envelopes
        env.sort(by: { (i, j) -> Bool in
            return i[0] < j[0] || (i[0] == j[0] && i[1] > j[1])
        })
        
        for i in 1 ..< env.count {
            for j in 0 ..< i {
                if env[j][1] < env[i][1] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp.max()!
    }
}
