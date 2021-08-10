/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 *
 * https://leetcode-cn.com/problems/two-sum/description/
 *
 * algorithms
 * Easy (48.42%)
 * Likes:    8278
 * Dislikes: 0
 * Total Accepted:    1.1M
 * Total Submissions: 2.2M
 * Testcase Example:  '[2,7,11,15]\n9'
 *
 * 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 * 
 * 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 * 
 * 
 * 
 * 示例:
 * 
 * 给定 nums = [2, 7, 11, 15], target = 9
 * 
 * 因为 nums[0] + nums[1] = 2 + 7 = 9
 * 所以返回 [0, 1]
 * 
 * 
 */
// 切题四件套
// 1、多看几遍题目 Clarification
// 2、想可能的解法都想一遍， Possible solutions
//     分析和比较时间和空间复杂度 
//     加强练习
// 3、多写 Coding
// 4、编写测试代码 Test Case 
// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else {
            return []
        }
        var res = [Int]()
        var map = [Int: Int]()
        for (i, v) in nums.enumerated() {
            let left = target - v
            if let exist = map[left] {
                res.append(exist)
                res.append(i)
                break
            }
            map[v] = i
        }
        return res
    }

    func twoSum_1(_ nums: [Int], _ target: Int) -> [Int] {
        var map:[Int: Int] = [Int: Int]() //
        for i in 0..<nums.count {
            let lv = target - nums[i]

            if map[lv] != nil {
                return [map[lv]!, i]
            } else {
                map[nums[i]] = i
            }
        }
        return []       
    }
}
// @lc code=end

