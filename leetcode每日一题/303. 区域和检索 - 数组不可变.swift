//
//  303. 区域和检索 - 数组不可变.swift
//  INTERVIEW
//
//  Created by Scan on 2021/3/2.
//  Copyright © 2021 钱志新. All rights reserved.
//

import Foundation

//给定一个整数数组  nums，求出数组从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点。
//
//实现 NumArray 类：
//
//NumArray(int[] nums) 使用数组 nums 初始化对象
//int sumRange(int i, int j) 返回数组 nums 从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点（也就是 sum(nums[i], nums[i + 1], ... , nums[j])）
//提示：
//
//0 <= nums.length <= 104
//-105 <= nums[i] <= 105
//0 <= i <= j < nums.length
//最多调用 104 次 sumRange 方法

class NumArray {
    /*
    private var inner_nums = [Int]()
    
    init(_ nums: [Int]) {
        inner_nums = nums
    }
    func sumRange(_ i: Int, _ j: Int) -> Int {
        guard i >= 0 && j >= i && j < inner_nums.count else {
            return 0
        }
        var res = 0
        for k in i ... j {
            res += inner_nums[k]
        }
        return res
    }
    */
    //    最多调用 104 次 sumRange 方法
    private var inner_nums = [Int]()
    init(_ nums: [Int]) {
        inner_nums = [Int](repeating:0, count: nums.count)
        if nums.count > 0 {
            inner_nums[0] = nums[0]
            for j in 1 ..< nums.count {
                inner_nums[j] = inner_nums[j - 1] + nums[j]
            }
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if i == 0 {
            return inner_nums[j]
        }
        return inner_nums[j] - inner_nums[i - 1]
    }
    
}
