//
//  201.数字范围按位与.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定范围 [m, n]，其中 0 <= m <= n <= 2147483647，
//返回此范围内所有数字的按位与（包含 m, n 两端点）。
import Foundation

class Sulotion_201 {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var n = n
        while n > m {
            n &= (n - 1)//依次把右边的1换成0
        }
        return n
    }
    
    func rangeBitwiseAnd_1(_ m: Int, _ n: Int) -> Int {
        var count = 0, n = n, m = m
        while m < n {//找公共前缀
            n = n >> 1
            m = m >> 1
            count += 1
        }
        return m << count
    }
}
