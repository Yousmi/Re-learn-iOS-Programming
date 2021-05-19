//
//  231.2的幂.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/16.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
import Foundation

class Solution_231 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var count = 0, n = n
        while n > 0 {
            n &= (n - 1)
            count += 1
            if count > 1 {
                return false
            }
        }
        return count == 1
    }
}
