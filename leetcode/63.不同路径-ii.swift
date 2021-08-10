/*
 * @lc app=leetcode.cn id=63 lang=swift
 *
 * [63] 不同路径 II
 *
 * https://leetcode-cn.com/problems/unique-paths-ii/description/
 *
 * algorithms
 * Medium (33.26%)
 * Likes:    394
 * Dislikes: 0
 * Total Accepted:    95.2K
 * Total Submissions: 260.4K
 * Testcase Example:  '[[0,0,0],[0,1,0],[0,0,0]]'
 *
 * 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 * 
 * 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 * 
 * 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
 * 
 * 
 * 
 * 网格中的障碍物和空位置分别用 1 和 0 来表示。
 * 
 * 说明：m 和 n 的值均不超过 100。
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * [0,0,0],
 * [0,1,0],
 * [0,0,0]
 * ]
 * 输出: 2
 * 解释:
 * 3x3 网格的正中间有一个障碍物。
 * 从左上角到右下角一共有 2 条不同的路径：
 * 1. 向右 -> 向右 -> 向下 -> 向下
 * 2. 向下 -> 向下 -> 向右 -> 向右
 * 
 * 
 */

// @lc code=start
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 else {
            return 0
        }
        let row = obstacleGrid.count, col = obstacleGrid.first!.count
        var map = [String: Int]()
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i > row - 1 || j > col - 1 || obstacleGrid[i][j] == 1 {
                return 0
            }
            if i == row - 1 && j == col - 1 {
                return 1
            }
            if let cache = map["\(i)-\(j)"] {
                return cache
            }
            let res = dfs(i + 1, j) + dfs(i, j + 1)
            map["\(i)-\(j)"] = res
            return res
        }
        return dfs(0, 0)
    }

    func uniquePathsWithObstacles_2(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 else {
            return 0
        }
        let row = obstacleGrid.count, col = obstacleGrid.first!.count
        var dp = [[Int]](repeating:[Int](repeating: 0, count: col), count: row)
        for i in 0 ..< row {
            if obstacleGrid[i][0] == 1 {
                break
            }
            dp[i][0] = 1
        }
        for j in 0 ..< col {
            if obstacleGrid[0][j] == 1 {
                break
            }
            dp[0][j] = 1
        }
        for i in 1 ..< row {
            for j in 1 ..< col {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0                    
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[row-1][col-1]
    }
    
    func uniquePathsWithObstacles_1(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 else {
            return 0
        }
        let row = obstacleGrid.count, col = obstacleGrid[0].count
        var dp = [[Int]](repeating:[Int](repeating:0, count: col), count: row)
        dp[0][0] = obstacleGrid[0][0] == 0 ? 1 : 0
        for i in 1 ..< row {
            dp[i][0] = dp[i - 1][0] == 0 ? 0 : (obstacleGrid[i][0] == 0 ? dp[i - 1][0] : 0)
        }
        for j in 1 ..< col {
            dp[0][j] = dp[0][j - 1] == 0 ? 0 : (obstacleGrid[0][j] == 0 ? dp[0][j - 1] : 0)
        }
        for i in 1 ..< row {
            for j in 1 ..< col {
                if obstacleGrid[i][j] == 0 {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                } else {
                    dp[i][j] = 0
                }
            }
        }
        return dp[row - 1][col - 1]
    }
}
// @lc code=end