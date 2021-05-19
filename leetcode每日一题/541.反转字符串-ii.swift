//
//  541.反转字符串-ii.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_541 {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var temp = Array(s)
        for i in stride(from: 0, to: temp.count, by: 2 * k) {
            var l = i, r = min(temp.count - 1, i + k - 1)
            while l < r {
                temp.swapAt(l, r)
                l += 1
                r -= 1
            }
        }
        return String(temp)
    }
    func reverseStr_1(_ s: String, _ k: Int) -> String {
        guard k > 0 && s.count > 0 else {
            return s
        }
        var temp = Array(s)
        var start = 0
        while start < temp.count {
            if start + k - 1 < temp.count {
                reves(&temp, start, start + k - 1)
            } else {
                reves(&temp, start, temp.count - 1)
            }
            start = start + 2 * k
        }
        return String(temp)
    }

    private func reves(_ temp: inout [Character], _ left: Int, _ right: Int) {
        var l = left, r = right
        while l < r {
            temp.swapAt(l,r)
            l += 1
            r -= 1
        }
    }
}
