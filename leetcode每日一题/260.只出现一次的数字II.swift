//
//  260.只出现一次的数字II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/4.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//给定一个整数数组 nums，其中恰好有两个元素只出现一次，其余所有元素均出现两次。 找出只出现一次的那两个元素。
//输入: [1,2,1,3,2,5]
//输出: [3,5]
class Solution_260 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var bitmask = 0, x = 0
        for num in nums {
            bitmask = bitmask ^ num
        }
        let diff = bitmask & (-bitmask)
        for num in nums {
            if diff & num != 0 {
                x = x ^ num
            }
        }
        return [x, bitmask ^ x]
    }
    
    
    func singleNumber_2(_ nums: [Int]) -> [Int] {
        var map = [Int: Int]()
        for i in nums {
            if let c = map[i] {
                map[i] = c + 1
            } else {
                map[i] = 1
            }
        }
        var res = [Int]()
        for j in map {
            if j.value == 1 {
                res.append(j.key)
            }
        }
        return res.sorted()
    }
}
