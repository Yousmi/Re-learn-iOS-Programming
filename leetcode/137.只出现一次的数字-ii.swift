/*
 * @lc app=leetcode.cn id=137 lang=swift
 *
 * [137] 只出现一次的数字 II
 *
 * https://leetcode-cn.com/problems/single-number-ii/description/
 *
 * algorithms
 * Medium (67.12%)
 * Likes:    370
 * Dislikes: 0
 * Total Accepted:    34.2K
 * Total Submissions: 50.8K
 * Testcase Example:  '[2,2,3,2]'
 *
 * 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现了三次。找出那个只出现了一次的元素。
 * 
 * 说明：
 * 
 * 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 * 
 * 示例 1:
 * 
 * 输入: [2,2,3,2]
 * 输出: 3
 * 
 * 
 * 示例 2:
 * 
 * 输入: [0,1,0,1,0,1,99]
 * 输出: 99
 * 
 */

// @lc code=start
// 1.确认题目意思
// 2.想各种可能的解法,评估时间，空间复杂度
// 3.编码
// 4.测试
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var one = 0, two = 0
        for i in nums {
            one = (one ^ i) & ~two
            two = (two ^ i) & ~one
        }
        return one
    }

    // func singleNumber(_ nums: [Int]) -> Int {
    //     var map = [Int: Int]()
    //     for i in nums {
    //         if let c = map[i] {
    //             map[i] = c + 1
    //         } else {
    //             map[i] = 1
    //         }
    //     }
    //     for j in map {
    //         if j.value == 1 {
    //             return j.key
    //         }
    //     }
    //     return 0
    // }
}
// @lc code=end

