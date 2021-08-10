/*
 * @lc app=leetcode.cn id=15 lang=swift
 *
 * [15] 三数之和
 *
 * https://leetcode-cn.com/problems/3sum/description/
 *
 * algorithms
 * Medium (27.19%)
 * Likes:    2304
 * Dislikes: 0
 * Total Accepted:    259.8K
 * Total Submissions: 921.9K
 * Testcase Example:  '[-1,0,1,2,-1,-4]'
 *
 * 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0
 * ？请你找出所有满足条件且不重复的三元组。
 * 
 * 注意：答案中不可以包含重复的三元组。
 * 
 * 
 * 
 * 示例：
 * 
 * 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 * 
 * 满足要求的三元组集合为：
 * [
 * ⁠ [-1, 0, 1],
 * ⁠ [-1, -1, 2]
 * ]
 * 
 * 
 */

// @lc code=start
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        let nums = nums.sorted()
        var res: Set<[Int]> = Set()
        for i in 0 ..< nums.count - 2 {
            let v = nums[i]
            if v > 0 {
                break
            }
            if i > 0 && v == nums[i - 1]  {
                continue
            }
            var left = i + 1, right = nums.count - 1
            while  left < right {
                let lv = nums[left], rv = nums[right]
                if v + lv + rv == 0 {
                    res.insert([v, lv, rv])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if (v + lv + rv) < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return Array(res)
    }
}
// @lc code=end

