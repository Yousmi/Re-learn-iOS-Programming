//
//  69.x 的平方根.swift
//  INTERVIEW
//
//  Created by 钱志新(平安科技快乐平安团队iOS开发组) on 2020/8/4.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_69 {
    //二分法求解
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else {
            return x
        }
        var left = 0
        var right = x
        while left < right {
            let mid = left + ((right - left) >> 1) + 1
            if mid * mid > x {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}
