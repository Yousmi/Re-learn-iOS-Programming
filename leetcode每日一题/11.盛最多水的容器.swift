//
//  11.盛最多水的容器.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/19.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_11 {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else {
            return 0
        }
        var res = 0
        var left = 0
        var right = height.count - 1
        
        while left < right {
            let lv = height[left]
            let rv = height[right]
            
            res = max(min(lv, rv)*(right - left), res)
            if lv >= rv {
                right -= 1
            } else {
                left += 1
            }
        }
        return res
    }
}
