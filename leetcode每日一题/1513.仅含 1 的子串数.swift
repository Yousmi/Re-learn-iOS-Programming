//
//  1513.仅含 1 的子串数.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//给你一个二进制字符串 s（仅由 '0' 和 '1' 组成的字符串）。
//
//返回所有字符都为 1 的子字符串的数目。
//
//由于答案可能很大，请你将它对 10^9 + 7 取模后返回。
class Solution_1513 {
    func numSub(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        let mode = 1000000007
        var res = 0, count = 0
        for i in s {
            if i == "1" {
                count += 1
            } else {
                res += count * (count + 1) / 2 % mode
                count = 0
            }
        }
        res += count * (count + 1) / 2 % mode
        return res
    }
}
