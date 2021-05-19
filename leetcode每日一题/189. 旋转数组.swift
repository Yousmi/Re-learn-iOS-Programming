//
//  189. 旋转数组.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_189 {
    //第一遍：直接前插 0， 之后再交换，然后删除后面的 时间 O(k*n)
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k > 0 else {
            return
        }
        let l = nums.count
        for _ in 0 ..< k {
            nums.insert(0, at:0)
        }
        for i in 1 ... k {
           (nums[l+k-i], nums[k - i]) = (nums[k - i], nums[l+k-i])
        }
        for _ in 0 ..< k {
            nums.removeLast()
        }
    }
    
    func rotate_1(_ nums: inout [Int], _ k: Int) {
        guard k > 0 || k % nums.count != 0 else {
            return
        }
        let uk = k % nums.count
        let r = nums.count - 1
        revers(&nums, r - uk + 1, r)
        revers(&nums, 0, r - uk)
        revers(&nums, 0, r)

    }
    private func revers(_ nums: inout [Int], _ s: Int, _ e: Int) {
        var left = s, right = e
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}






















//MARK:- 第二遍 : 三次翻转
class Solution_189_1 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard k > 0 || k % nums.count != 0 else {
            return
        }
        let uk = k % nums.count
        let r = nums.count - 1
        revers(&nums, r - uk + 1, r)
        revers(&nums, 0, r - k )
        revers(&nums, 0, r)
    }
    
    private func revers(_ nums: inout [Int], _ s: Int, _ e: Int) {
        var left = s, right = e
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
