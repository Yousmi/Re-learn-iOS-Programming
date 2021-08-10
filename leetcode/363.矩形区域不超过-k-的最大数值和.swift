/*
 * @lc app=leetcode.cn id=363 lang=swift
 *
 * [363] 矩形区域不超过 K 的最大数值和
 *
 * https://leetcode-cn.com/problems/max-sum-of-rectangle-no-larger-than-k/description/
 *
 * algorithms
 * Hard (35.61%)
 * Likes:    81
 * Dislikes: 0
 * Total Accepted:    3.1K
 * Total Submissions: 8.6K
 * Testcase Example:  '[[1,0,1],[0,-2,3]]\n2'
 *
 * 给定一个非空二维矩阵 matrix 和一个整数 k，找到这个矩阵内部不大于 k 的最大矩形和。
 * 
 * 示例:
 * 
 * 输入: matrix = [[1,0,1],[0,-2,3]], k = 2
 * 输出: 2 
 * 解释: 矩形区域 [[0, 1], [-2, 3]] 的数值和是 2，且 2 是不超过 k 的最大数字（k = 2）。
 * 
 * 
 * 说明：
 * 
 * 
 * 矩阵内的矩形区域面积必须大于 0。
 * 如果行数远大于列数，你将如何解答呢？
 * 
 * 
 */

// @lc code=start
class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let row = matrix.count, col = matrix[0].count
        var res = Int.min
        for l in 0 ..< col {
            var rowSum = [Int](repeating: 0, count: row)
            for r in l ..< col {
                for i in 0 ..< row {
                    rowSum[i] += matrix[i][r]
                }
                res = max(res, dpmax(rowSum, k))
            }
        }
        return res
    }
    
    private func dpmax(_ arr: [Int], _ k: Int) -> Int {
        var rollSum = arr[0], rollMax = rollSum
        for i in 1 ..< arr.count {
            if rollSum > 0{
                rollSum += arr[i]
            } else {
                rollSum = arr[i]
            }
            rollMax = max(rollSum, rollMax)
        }
        if (rollMax <= k) {
            return rollMax
        }
        var res = Int.min
        for l in 0 ..< arr.count {
            var sum = 0
            for r in l ..< arr.count {
                sum += arr[r]
                if (sum > res && sum <= k) {
                    res = sum
                }
                if res == k {
                    return k
                }
            }
        }
        return res
    }
}
// @lc code=end

