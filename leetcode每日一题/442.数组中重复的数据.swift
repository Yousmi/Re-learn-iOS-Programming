//
//  442.数组中重复的数据.swift
//  Interview
//
//  Created by Scan on 2020/6/11.
//  Copyright © 2020 Scan. All rights reserved.
//

import Foundation

//给定一个整数数组 a，其中1 ≤ a[i] ≤ n （n为数组长度）, 其中有些元素出现两次而其他元素出现一次。
//
//找到所有出现两次的元素。
//
//你可以不用到任何额外空间并在O(n)时间复杂度内解决这个问题吗？
class Solution_442 {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return []
        }
        var temp = nums
        var res = [Int]()
        for i in 0 ..< temp.count {
            let l = abs(temp[i]) - 1 //构建索引，将num - 1的位置的数字取相反数，连续两次取相反数会变回来，便可判断元素出现次数。
            if temp[l] < 0 {
                res.append(l + 1)
            }
            temp[l] = -temp[l]
        }
        return res
    }
    
    func findDuplicates_1(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return []
        }
        var map = [Int: Int](), res = [Int]()
        for i in  nums {
            if map[i] != nil {
                res.append(i)
            } else {
               map[i] = i
            }
        }
        return res
    }
    
//    func findDuplicates_2(_ nums: [Int]) -> [Int] {
//        var temps = nums, res = [Int]()
//        for i in temps {
//            if i < 1 || i > temps.count {
//                return []
//            }
//        }
//        for i in 0 ..< temps.count {
//            while temps[i] - 1 != i {
//                let index = temps[i] - 1
//                if (temps[i] == temps[temps[index]]) {
//                    res.append(temps[i])
//                } else {
//                    temps.swapAt(temps[i], temps[temps[index]])
//                }
//            }
//        }
//        return res
//    }
}
