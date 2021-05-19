//
//  283. 移动零.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/27.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_283 {
    
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        for j in 0 ..< nums.count {
            if nums[j] != 0 {
                nums[i] = nums[j]
                i += 1
            }
        }
        for k in i ..< nums.count {
            nums[k] = 0
        }
    }
    //更优解法 O(n)
    func moveZeroes_1(_ nums: inout [Int]) {
        var j = 0 //始终记录上一个0的位置
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, j)
                j += 1
            }
        }
    }

     //强行遍历 ：O(n2) 当前是 0，就去找下一个不是0 的元素进行交换
     func moveZeroes_2(_ nums: inout [Int]) {
         var j = 1
         for i in 0 ..< nums.count {
             if nums[i] == 0 {
                 j = i + 1
                 while j < nums.count {
                     if nums[j] != 0 {
                         (nums[i], nums[j]) = (nums[j],nums[i])
                         break
                     }
                     j += 1
                 }
             }
         }
     }
}
