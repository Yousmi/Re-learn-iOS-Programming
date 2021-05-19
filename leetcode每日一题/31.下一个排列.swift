//
//  31.下一个排列.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/7.
//  Copyright © 2020 钱志新. All rights reserved.
//

//实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
//
//如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
//
//必须原地修改，只允许使用额外常数空间。
import Foundation

class Solution_31 {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 1, j = i
        while i > 0 && nums[i - 1] >= nums[i] {
            i -= 1
        }
        
        if i - 1 >= 0 {
            while j >= 0 && nums[i - 1] >= nums[j] {
                j -= 1
            }
            nums.swapAt(i - 1, j)
        }
        j = nums.count - 1
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}
