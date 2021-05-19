//
//  77.组合.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_77 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k > 0 && n >= k else {
            return []
        }
        var res = [[Int]](), arr = [Int]()
        func backTrack(_ begin: Int, _ level: Int) {
            if arr.count == k {
                res.append(arr)
                return
            }
            if n - begin + 1 < level {
                return
            }
            backTrack(begin + 1, level)
            arr.append(begin)
            backTrack(begin + 1, level - 1)
            _ = arr.popLast()
        }
        backTrack(1, k)
        return res
    }
}
