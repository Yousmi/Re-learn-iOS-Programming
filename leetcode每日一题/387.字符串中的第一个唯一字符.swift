//
//  387.字符串中的第一个唯一字符.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_387 {
    func firstUniqChar(_ s: String) -> Int {
        guard s.count > 0 else {
            return -1
        }
        var map = [Character: Int]()
        for (i, v) in s.enumerated() {
            if let s = map[v] {
                map[v] = s + i
            } else {
                map[v] = i;
            }
        }
        for (i, v) in s.enumerated() {
            if map[v]! == 1 {
                return i;
            }
        }
        return -1
    }
}
