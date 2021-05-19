//
//  26.删除排序数组中的重复项.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/26.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
//
//不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成
import Foundation

class Solution_26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        //直接调用了 remove 方法
        var i = 0, res = nums.count
        while i < nums.count - 1 {
            if nums[i] != nums[i + 1] {
                res -= 1
                nums.remove(at: i + 1)
            } else {
                i += 1
            }
        }
        return res
    }
}
























//MARK: - 第二遍
class Solution_26_1 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var start = 0, res = 1
        for i in 1 ..< nums.count {
            if nums[start] != nums[i]  {
                start += 1
                nums[start] = nums[i]
                res += 1
            }
        }
        return res
    }
}
