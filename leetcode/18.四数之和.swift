/*
 * @lc app=leetcode.cn id=18 lang=swift
 *
 * [18] 四数之和
 *
 * https://leetcode-cn.com/problems/4sum/description/
 *
 * algorithms
 * Medium (37.66%)
 * Likes:    523
 * Dislikes: 0
 * Total Accepted:    94K
 * Total Submissions: 246.9K
 * Testcase Example:  '[1,0,-1,0,-2,2]\n0'
 *
 * 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c
 * + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
 * 
 * 注意：
 * 
 * 答案中不可以包含重复的四元组。
 * 
 * 示例：
 * 
 * 给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。
 * 
 * 满足要求的四元组集合为：
 * [
 * ⁠ [-1,  0, 0, 1],
 * ⁠ [-2, -1, 1, 2],
 * ⁠ [-2,  0, 0, 2]
 * ]
 * 
 * 
 */

// @lc code=start
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }
        var set: Set<[Int]> = Set()
        let nums = nums.sorted()
        for i in 0 ... nums.count - 3 {
            for j in (i + 1) ... nums.count - 2 {
                var left = j + 1, right = nums.count - 1 
                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if target == sum {
                        let item = [nums[i], nums[j], nums[left], nums[right]]
                        set.insert(item)
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if (sum > target) {
                        right -= 1
                    } else {
                        left += 1
                    }
                }
            }
        }
        return Array(set)
    }
}
// @lc code=end

