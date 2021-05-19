//
//  42. 接雨水.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/2.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_42 {
    //单调栈
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }
        var res = 0, stack = [Int](), cur = 0
        while cur < height.count {
            while !stack.isEmpty && height[cur] > height[stack.last!] {
                let last = height[stack.popLast()!]
                if stack.isEmpty {
                    break;
                }
                let dis = cur - stack.last! - 1
                let m = min(height[stack.last!], height[cur])
                res = res + dis * (m - last)
            }
            stack.append(cur)
            cur += 1
        }
        return res
    }
    
    //双指针；
    //核心思路：左右2遍往中间夹击，记录左右2遍的最大值，每一步都需要计算值
    func trap_2(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }
        var res = 0, left = 1, right = height.count - 2
        var leftMax = height.first!, rightMax = height.last!
        while left < right {
            let lv = height[left], rv = height[right]
            if leftMax <= rightMax {
                res += max(0, leftMax - lv)
                leftMax = max(leftMax, lv)
                left += 1
            } else {
                res += max(0, rightMax - rv)
                rightMax = max(rightMax, rv)
                right -= 1
            }
        }
        return res
    }
    
    func trap_1(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }
        var res = 0
        
        for i in 1 ..< height.count {
            var lMax = 0, rMax = 0
            for l in 0 ... i {
                lMax = max(lMax, height[l])
            }
            for r in i ..< height.count {
                rMax = max(rMax, height[r])
            }
            res += min(lMax, rMax) - height[i]
        }
        return res
    }
}
