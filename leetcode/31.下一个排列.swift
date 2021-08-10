/*
 * @lc app=leetcode.cn id=31 lang=swift
 *
 * c
 *
 * https://leetcode-cn.com/problems/next-permutation/description/
 *
 * algorithms
 * Medium (33.68%)
 * Likes:    558
 * Dislikes: 0
 * Total Accepted:    71.7K
 * Total Submissions: 210.5K
 * Testcase Example:  '[1,2,3]'
 *
 * 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
 * 
 * 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
 * 
 * 必须原地修改，只允许使用额外常数空间。
 * 
 * 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 * 1,2,3 → 1,3,2
 * 3,2,1 → 1,2,3
 * 1,1,5 → 1,5,1
 * 
 */

// @lc code=start
class Solution {
    //思路 ： 反向找到一个升序的值，位置是 i, 交换完之后，翻转i - count - 1
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count == 0 {
            return
        }
        var i = nums.count - 1
        while i > 0 && nums[i - 1] >= nums[i] {
            i -= 1
        }
        if i - 1 >= 0 {
            var j = nums.count - 1
            while j > 0 && nums[j] <= nums[i - 1] {
                j -= 1
            }
            nums.swapAt(i - 1, j)
        }
        var j = nums.count - 1
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}
// @lc code=end

