//
//  136.只出现一次的数字.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/4.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
//
//说明：
//
//你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
class Solution_136 {
    func singleNumber(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var map = [Int: Int]()//key 是值， value是次数
        for i in nums {
            if map[i] != nil {
                map[i] = nil
            } else {
                map[i] = i
            }
        }
        return map.values.first ?? 0
    }
    
    
    func singleNumber_1(_ nums: [Int]) -> Int {
        var res = 0
        for i in nums {
            res = res ^ i
        }
        return res
    }
    
    func singleNumber_2(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.first ?? 0
        }
        
        var res = 0
        let temp = nums.sorted()
        var i = 0
        while i < temp.count - 2 {
            if temp[i] == temp[i + 1] {
                res = temp[i+2]
            } else if temp[i + 1] == temp[i + 2] {
                return temp[i]
            }
            i = i + 2
        }
        
        return res
    }
}
