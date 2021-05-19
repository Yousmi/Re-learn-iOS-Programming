//
//  半有序数组的无序下标.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/19.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_1_1 {
    func preOrderIndex(_ array: [Int]) -> Int {
        guard array.count > 1 else {
            return -1
        }
        var res = 0, left = 0, right = array.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let leftV = array[left], midV = array[mid]
            
            if leftV < midV { //中间大
                left = mid
            }
            if midV < leftV {
                right = mid
            }
            
            if array[left] > array[left - 1] && array[left] > array[right] && right < array.count - 1 && array[right] < array[right + 1] {
                res = left + 1
            }
        }
        
        return res
    }
}
