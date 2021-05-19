//
//  74. 搜索二维矩阵.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/3.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_74 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return false
        }
        var ori:[Int]?
        for item in matrix {
            if target <= item.last! && item.first! <= target {
                ori = item
                break
            }
        }
        if let ori = ori {
            if target == ori.last! || ori.first! == target {
                return true
            }
            return search(ori, target, 0, ori.count - 1)
        }
        return false
    }

    private func search(_ nums:[Int], _ target: Int, _ left: Int, _ right: Int) -> Bool {
        if left > right {
            return false
        }
        let mid = left + (right - left) >> 1
        if target == nums[mid] {
            return true
        } else if target > nums[mid] {
            return search(nums, target, mid + 1, right)
        } else {
            return search(nums, target, left, mid - 1)
        }
    }
}
