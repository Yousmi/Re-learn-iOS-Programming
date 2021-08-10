/*
 * @lc app=leetcode.cn id=84 lang=swift
 *
 * [84] 柱状图中最大的矩形
 */

// @lc code=start
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
    }
    func largestRectangleArea_1(_ heights: [Int]) -> Int {
        guard heights.count > 0 else {
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
}
// @lc code=end

