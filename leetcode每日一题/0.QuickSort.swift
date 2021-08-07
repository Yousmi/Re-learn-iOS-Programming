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
    //基准点的选择  
    //选取一个锚点 然后递归排列左右2边进行排序
    //1、选择最右边的节点的值 作为比较点  
    //2、最左边的为起始点  
    //3、从左往右循环遍历
    //4、遇到比锚点小的，直接交换起始点和遍历下标的值 
    //5、最终交换交换点跟锚点的值
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
