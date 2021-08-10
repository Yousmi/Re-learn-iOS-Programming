/*
 * @lc app=leetcode.cn id=74 lang=swift
 *
 * [74] 搜索二维矩阵
 *
 * https://leetcode-cn.com/problems/search-a-2d-matrix/description/
 *
 * algorithms
 * Medium (37.99%)
 * Likes:    216
 * Dislikes: 0
 * Total Accepted:    54.7K
 * Total Submissions: 141.9K
 * Testcase Example:  '[[1,3,5,7],[10,11,16,20],[23,30,34,50]]\n3'
 *
 * 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
 * 
 * 
 * 每行中的整数从左到右按升序排列。
 * 每行的第一个整数大于前一行的最后一个整数。
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * matrix = [
 * ⁠ [1,   3,  5,  7],
 * ⁠ [10, 11, 16, 20],
 * ⁠ [23, 30, 34, 50]
 * ]
 * target = 3
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * matrix = [
 * ⁠ [1,   3,  5,  7],
 * ⁠ [10, 11, 16, 20],
 * ⁠ [23, 30, 34, 50]
 * ]
 * target = 13
 * 输出: false
 * 
 */

// @lc code=start
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return false
        }
        var ori:[Int]?
        for item in matrix {
            if target <= item.last! && item.first! <= target {
                ori = item
                break
            }
        }
        if let ori = ori {
            if target == ori.last! || ori.first! == target {
                return true
            }
            return search(ori, target, 0, ori.count - 1)
        }
        return false
    }

    private func search(_ nums:[Int], _ target: Int, _ left: Int, _ right: Int) -> Bool {
        if left > right {
            return false
        }
        let mid = left + (right - left) >> 1
        if target == nums[mid] {
            return true
        } else if target > nums[mid] {
            return search(nums, target, mid + 1, right)
        } else {
            return search(nums, target, left, mid - 1)
        }
    }
}
// @lc code=end

