/*
 * @lc app=leetcode.cn id=42 lang=swift
 *
 * [42] 接雨水
 *
 * https://leetcode-cn.com/problems/trapping-rain-water/description/
 *
 * algorithms
 * Hard (51.16%)
 * Likes:    1410
 * Dislikes: 0
 * Total Accepted:    116K
 * Total Submissions: 225.2K
 * Testcase Example:  '[0,1,0,2,1,0,1,3,2,1,2,1]'
 *
 * 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 * 
 * 
 * 
 * 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢
 * Marcos 贡献此图。
 * 
 * 示例:
 * 
 * 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 * 输出: 6
 * 
 */

// @lc code=start
class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }
        var left = 1, right = height.count - 2
        var lMax = height.first!, rMax = height.last!
        var res = 0
        while left < right {
            let lv = height[left], rv = height[right]
            if lMax < rMax {
                res += max(0, lMax - lv)
                lMax = max(lMax, lv)
                left += 1
            } else {
                res += max(0, rMax - rv)
                rMax = max(rMax, rv)
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
// @lc code=end

