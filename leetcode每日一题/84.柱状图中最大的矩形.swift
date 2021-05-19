//
//  84.柱状图中最大的矩形.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_84 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        guard heights.count > 1 else {
            return 0
        }
        var res = 0, stack = [Int]() //单调增: 存的是下标
        stack.append(-1)
        for i in 0 ..< heights.count {
            let v = heights[i]
            while let top = stack.last, top != -1 && heights[top] > v {
                let cur = stack.popLast()!
                let left = stack.last!
                res = max(res, heights[cur] * (i - left - 1))
            }
            stack.append(i)
        }
        while let top = stack.last, top != -1 {
            let cur = stack.popLast()!
            let left = stack.last!
            res = max(res, heights[cur] * (heights.count - left - 1))
        }
        return res
    }
    
    func largestRectangleArea_1(_ heights: [Int]) -> Int {
        var stack: [Int] = [-1]
        var maxArea = 0
        for index in 0..<heights.count {
            while let last = stack.last, last != -1 && heights[last] >= heights[index] {
                let popIndex = stack.popLast()!
                let last = stack.last!
                maxArea = max(maxArea, (index - last - 1) * heights[popIndex])
            }
            stack.append(index)
        }

        while let last = stack.last, last != -1 {
            let popIndex = stack.popLast()!
            let last = stack.last!
            maxArea = max(maxArea, (heights.count - last - 1) * heights[popIndex])
        }
        
        return maxArea
    }
}
