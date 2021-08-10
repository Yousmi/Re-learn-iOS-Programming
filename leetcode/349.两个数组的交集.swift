/*
 * @lc app=leetcode.cn id=349 lang=swift
 *
 * [349] 两个数组的交集
 *
 * https://leetcode-cn.com/problems/intersection-of-two-arrays/description/
 *
 * algorithms
 * Easy (69.34%)
 * Likes:    194
 * Dislikes: 0
 * Total Accepted:    75.2K
 * Total Submissions: 108.1K
 * Testcase Example:  '[1,2,2,1]\n[2,2]'
 *
 * 给定两个数组，编写一个函数来计算它们的交集。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：nums1 = [1,2,2,1], nums2 = [2,2]
 * 输出：[2]
 * 
 * 
 * 示例 2：
 * 
 * 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 * 输出：[9,4]
 * 
 * 
 * 
 * 说明：
 * 
 * 
 * 输出结果中的每个元素一定是唯一的。
 * 我们可以不考虑输出结果的顺序。
 * 
 * 
 */

// @lc code=start
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let map = makeMap(nums2)
        var exMap = [Int: Int]() 
        for v in nums1 {
            if map[v] != nil && exMap[v] == nil {
                exMap[v] = 1
            }
        }
        return Array(exMap.keys)
    }
    
    private func makeMap(_ nums: [Int]) -> [Int: Int] {
        var res = [Int: Int]()
        for (i, v) in nums.enumerated() {
            if res[v] == nil {
                res[v] = i   
            }
        }
        return res 
    }
}
// @lc code=end

