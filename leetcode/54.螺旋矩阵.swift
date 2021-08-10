/*
 * @lc app=leetcode.cn id=54 lang=swift
 *
 * [54] 螺旋矩阵
 *
 * https://leetcode-cn.com/problems/spiral-matrix/description/
 *
 * algorithms
 * Medium (40.24%)
 * Likes:    416
 * Dislikes: 0
 * Total Accepted:    67.7K
 * Total Submissions: 166.2K
 * Testcase Example:  '[[1,2,3],[4,5,6],[7,8,9]]'
 *
 * 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * ⁠[ 1, 2, 3 ],
 * ⁠[ 4, 5, 6 ],
 * ⁠[ 7, 8, 9 ]
 * ]
 * 输出: [1,2,3,6,9,8,7,4,5]
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * [
 * ⁠ [1, 2, 3, 4],
 * ⁠ [5, 6, 7, 8],
 * ⁠ [9,10,11,12]
 * ]
 * 输出: [1,2,3,4,8,12,11,10,9,5,6,7]
 * 
 * 
 */

// @lc code=start
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 {
            return []
        }
        var res = [Int]()
        let m = matrix.count, n = matrix[0].count, level = (min(m, n) + 1) / 2
            
        var i = 0
        while i < level {
            
            for j in i ..< n - i { //右
                res.append(matrix[i][j])
            }
            
            for j in (i+1) ..< m - i {//下
                res.append(matrix[j][(n-1)-i])
            }
            
            var j = (n - 1) - (i + 1)
            while j >= 0 {
                if j >= i && (m-1) - i != i {
                    res.append(matrix[(m-1) - i][j])
                }
                j -= 1
            }
            
            j = (m - 1) - (i + 1)
            while j >= 0 {
                if j >= i+1 && (n-1) - i != i {
                   res.append(matrix[j][i])
                }
                j -= 1
            }
            i += 1
        }
        return res
    }
}
// @lc code=end

