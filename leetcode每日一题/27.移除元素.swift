//
//  27.移除元素.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/22.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        remov(val, &nums, 0)
        return nums.count
    }
    
    private func remov(_ val: Int, _ nums: inout [Int], _ index: Int) {
        if index == nums.count {
            return
        }
        if nums[index] == val {
            nums.remove(at: index)
            remov(val, &nums, index)
            if index == nums.count {
                return
            }
        } else {
            if index + 1 == nums.count {
                return
            }
            remov(val, &nums, index+1)
        }
    }
}
