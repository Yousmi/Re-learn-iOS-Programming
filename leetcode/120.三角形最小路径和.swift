/*
 * @lc app=leetcode.cn id=120 lang=swift
 *
 * [120] 三角形最小路径和
 *
 * https://leetcode-cn.com/problems/triangle/description/
 *
 * algorithms
 * Medium (64.75%)
 * Likes:    554
 * Dislikes: 0
 * Total Accepted:    97.2K
 * Total Submissions: 145.7K
 * Testcase Example:  '[[2],[3,4],[6,5,7],[4,1,8,3]]'
 *
 * 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
 * 
 * 相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。
 * 
 * 
 * 
 * 例如，给定三角形：
 * 
 * [
 * ⁠    [2],
 * ⁠   [3,4],
 * ⁠  [6,5,7],
 * ⁠ [4,1,8,3]
 * ]
 * 
 * 
 * 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 * 
 * 
 * 
 * 说明：
 * 
 * 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。
 * 
 */

// @lc code=start
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        var dp = triangle, i = triangle.count - 2
        while i >= 0 {
            for j in 0 ..< triangle[i].count {
                dp[i][j] += min(dp[i + 1][j], dp[i + 1][j + 1])
            }
            i -= 1
        }
        return dp[0][0]
    }
    
    func minimumTotal_1(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        var dp = triangle
        for i in 1 ..< triangle.count {
            let pre = triangle[i - 1], cur = triangle[i]
            for j in 0 ..< cur.count  {
                if j == 0 {
                    dp[i][j] = dp[i - 1][j]
                } else if j >= pre.count {
                    dp[i][j] = dp[i - 1][pre.count - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j])
                }
                dp[i][j] += triangle[i][j]
            }
        }
        return dp[triangle.count - 1].min()!
    }
}
// @lc code=end

