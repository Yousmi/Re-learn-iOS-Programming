/*
 * @lc app=leetcode.cn id=442 lang=swift
 *
 * [442] 数组中重复的数据
 *
 * https://leetcode-cn.com/problems/find-all-duplicates-in-an-array/description/
 *
 * algorithms
 * Medium (65.57%)
 * Likes:    204
 * Dislikes: 0
 * Total Accepted:    17.7K
 * Total Submissions: 27K
 * Testcase Example:  '[4,3,2,7,8,2,3,1]'
 *
 * 给定一个整数数组 a，其中1 ≤ a[i] ≤ n （n为数组长度）, 其中有些元素出现两次而其他元素出现一次。
 * 
 * 找到所有出现两次的元素。
 * 
 * 你可以不用到任何额外空间并在O(n)时间复杂度内解决这个问题吗？
 * 
 * 示例：
 * 
 * 
 * 输入:
 * [4,3,2,7,8,2,3,1]
 * 
 * 输出:
 * [2,3]
 * 
 * 
 */

// @lc code=start
class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else {
            return []
        }
        var tem = nums, res = [Int]()
        for i in 0 ..< nums.count {
            let j = abs(tem[i]) - 1
            if tem[j] < 0 {
                res.append(nums[i])
            }
            tem[j] = -tem[j]
        }
        return res
    }

    // func findDuplicates(_ nums: [Int]) -> [Int] {
    //     guard nums.count > 1 else {
    //         return []
    //     }
    //     var map = [Int: Int](), res = [Int]()
    //     for i in  nums {
    //         if map[i] != nil {
    //             res.append(i)
    //         } else {
    //            map[i] = i
    //         }
    //     }
    //     return res
    // }
}
// @lc code=end

