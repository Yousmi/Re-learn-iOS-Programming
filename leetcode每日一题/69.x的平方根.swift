//
//  69.x的平方根.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

// x 的平方根 二分法
import Foundation
class Solution_69 {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {
            return  x
        }
        var left = 0, right = x
        while left < right {
            let mid = left + (right - left) >> 1 + 1
            if mid * mid > x {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}
