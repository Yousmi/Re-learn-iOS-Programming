//
//  QuickSort.swift
//  NSHashTabelTest
//
//  Created by 钱志新 on 2020/7/13.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class QuickSort {
    func quickSort(_ nums: inout [Int]) {
        _quickSort(&nums, 0, nums.count - 1)
    }
    
    private func _quickSort(_ nums: inout [Int], _ p: Int, _ r: Int) {
        if p >= r {
            return
        }
        let q = partition(&nums, p, r)
        _quickSort(&nums, p, q - 1);
        _quickSort(&nums, q + 1, r);
    }
    
    private func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let pivot = nums[right]
        var i = left
        for j in left ..< right {
            if nums[j] < pivot {
                nums.swapAt(i, j)
                i += 1
            }
        }
        if nums[i] != nums[right] { //处理稳定的排序方法
            nums.swapAt(i, right)
        }
        return i
    }
}
