//
//  137.只出现一次的数字II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/4.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现了三次。找出那个只出现了一次的元素。
//
//说明：
//
//你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
class Solution_137 {
    func singleNumber(_ nums: [Int]) -> Int {
        var one = 0, two = 0
        for i in nums {
            one = (one ^ i) & ~two
            two = (two ^ i) & ~one
        }
        return one
    }
    
    func singleNumber_1(_ nums: [Int]) -> Int {
        var res = 0
        var map: [Int: Int] = [:]
        for i in nums {
            if let c = map[i] {
                map[i] = c + 1
            } else {
                map[i] = 1
            }
        }
        for i in map {
            if i.value == 1 {
                res = i.key
                break
            }
        }
        return res
    }
}
