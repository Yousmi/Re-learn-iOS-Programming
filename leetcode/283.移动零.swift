/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 *
 * https://leetcode-cn.com/problems/move-zeroes/description/
 *
 * algorithms
 * Easy (61.01%)
 * Likes:    629
 * Dislikes: 0
 * Total Accepted:    164.4K
 * Total Submissions: 268K
 * Testcase Example:  '[0,1,0,3,12]'
 *
 * 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 * 
 * 示例:
 * 
 * 输入: [0,1,0,3,12]
 * 输出: [1,3,12,0,0]
 * 
 * 说明:
 * 
 * 
 * 必须在原数组上操作，不能拷贝额外的数组。
 * 尽量减少操作次数。
 * 
 * 
 */

// @lc code=start
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                nums[j] = nums[i]
                j += 1
            }
        }
        for i in j ..< nums.count {
            nums[i] = 0
        }
    }
    
    //记录上一个 0 的位置，进行交换
    func moveZeroes_2(_ nums: inout [Int]) {
        var j = 0 
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                (nums[i], nums[j]) = (nums[j], nums[i])
                j += 1
            }
        }
    }
    
    
    //强行遍历 ：O(n2) 当前是 0，就去找下一个不是0 的元素进行交换
    func moveZeroes_1(_ nums: inout [Int]) {
        for i in 0 ..< nums.count - 1 {
            if nums[i] == 0 {
                for j in i + 1 ..< nums.count {
                    if nums[j] != 0 {
                        (nums[i], nums[j]) = (nums[j], nums[i]) 
                        break
                    }
                }
            }
        }
    }
    
}
// @lc code=end

