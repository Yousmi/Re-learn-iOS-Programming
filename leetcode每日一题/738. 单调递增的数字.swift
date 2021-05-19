//
//  738. 单调递增的数字.swift
//  INTERVIEW
//
//  Created by Scan on 2021/3/2.
//  Copyright © 2021 钱志新. All rights reserved.
//

import Foundation

//给定一个非负整数 N，找出小于或等于 N 的最大的整数，同时这个整数需要满足其各个位数上的数字是单调递增。
//
//（当且仅当每个相邻位数上的数字 x 和 y 满足 x <= y 时，我们称这个整数是单调递增的。）

class Solution_738 {
    func monotoneIncreasingDigits(_ N: Int) -> Int {
        let str = String(N)
        var arr:[Character] = Array(str)
        var ma = -1, idx = -1
        for i in 0 ..< arr.count - 1 {
            let iv = Int(String(arr[i]))!
            if ma < iv {
                ma = iv
                idx = i
            }

            if arr[i] > arr[i + 1] {
                let idxv = Int(String(arr[idx]))!
                arr[idx] = Character(String(idxv - 1))
                for j in idx + 1 ..< arr.count {
                    arr[j] = "9"
                }
            }
            
        }
        return Int(String(arr))!
    }
    
    func monotoneIncreasingDigits_1(_ N: Int) -> Int {
        var N = N
        var last = N % 10, cur = 0, n = 1, ret = N
        
        while N != 0 {
            N = N / 10
            cur = N % 10
            if cur > last {
                let q = Int(pow(10, Double(n)))
                ret = N * q - 1
                N = ret / q
                cur = N % 10
            }
            last = cur
            n += 1
        }
        return ret
    }
}
