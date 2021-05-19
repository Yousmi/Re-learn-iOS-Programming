//
//  459.重复的子字符串.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/25.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_459 {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        guard s.count > 1 else {
            return false
        }
        let temp = Array(s), count = temp.count
        let end = temp.last!
        for i in 0 ..< count / 2 {
            if temp[i] == end {
                if count % (i + 1) != 0 {
                    continue
                }
                var j = i + 1, flag = true
                let subs = String(temp[0 ... i])
                while i + j < count {
                    let temps = String(temp[j ... i + j])
                    if temps != subs {
                        flag = false
                        break
                    }
                    j = (j + i) + 1
                }
                if flag {
                    return true
                }
            }
        }
        return false
    }
}
