//
//  78.子集.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

//Companies
//给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

//说明：解集不能包含重复的子集。
import Foundation

class Solution_78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        _backtrack(nums, &res, [], 0)
        return res
    }
    private func _backtrack(_ nums: [Int], _ res: inout [[Int]], _ temp:[Int], _ level: Int) {
        res.append(temp)
        for i in level ..< nums.count {
            var temp = temp
            temp.append(nums[i])
            _backtrack(nums, &res, temp, i + 1)
            temp.removeAll()
        }
    }
    
    func subsets_1(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        for i in nums {
            for j in 0 ..< res.count {
                var temp = res[j]
                temp.append(i)
                res.append(temp)
            }
            res.append([i])
        }
        res.append([])
        return res
    }
}
