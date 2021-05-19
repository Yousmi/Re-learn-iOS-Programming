//
//  349.两个数组的交集.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/6/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定两个数组，编写一个函数来计算它们的交集。
//示例 1：
//
//输入：nums1 = [1,2,2,1], nums2 = [2,2]
//输出：[2]
//示例 2：
//
//输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//输出：[9,4]
//
//说明：
//
//输出结果中的每个元素一定是唯一的。
//我们可以不考虑输出结果的顺序。
import Foundation

class Solution_349 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let map1 = makeMap(nums2)
        var map2 = [Int : Int]()
        for i in nums1 {
            if map1[i] != nil && map2[i] == nil {
                map2[i] = 1
            }
        }
        return Array(map2.keys)
    }
    private func makeMap(_ nums: [Int]) -> [Int: Int] {
        var map1 = [Int : Int]()
        for (i, v) in nums.enumerated() {
            if map1[v] == nil {
                map1[v] = i
            }
        }
        return map1
    }
}
