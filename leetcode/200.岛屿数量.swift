/*
 * @lc app=leetcode.cn id=200 lang=swift
 *
 * [200] 岛屿数量
 *
 * https://leetcode-cn.com/problems/number-of-islands/description/
 *
 * algorithms
 * Medium (50.10%)
 * Likes:    723
 * Dislikes: 0
 * Total Accepted:    145.8K
 * Total Submissions: 291K
 * Testcase Example:  '[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]'
 *
 * 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
 * 
 * 岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。
 * 
 * 此外，你可以假设该网格的四条边均被水包围。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * ['1','1','1','1','0'],
 * ['1','1','0','1','0'],
 * ['1','1','0','0','0'],
 * ['0','0','0','0','0']
 * ]
 * 输出: 1
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * [
 * ['1','1','0','0','0'],
 * ['1','1','0','0','0'],
 * ['0','0','1','0','0'],
 * ['0','0','0','1','1']
 * ]
 * 输出: 3
 * 解释: 每座岛屿只能由水平和/或竖直方向上相邻的陆地连接而成。
 * 
 * 
 */
            // dfs(i + 1, j) //下
            // dfs(i - 1, j) //上
            // dfs(i, j + 1) //右
            // dfs(i, j - 1) //左
// @lc code=start
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        let x = [1, -1, 0, 0], y = [0, 0, 1, -1]
        var res = 0, grid = grid
        let row = grid.count, col = grid[0].count
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || i >= row || j < 0 || j >= col || grid[i][j] != "1" {
                return
            }
            grid[i][j] = "0"
            for k in 0 ..< 4 {
                dfs(i + x[k], j + y[k]) //下
            }
        }
        for i in 0 ..< row {
            for j in 0 ..< col {
                if grid[i][j] == "1" {
                    dfs(i, j)
                    res += 1
                }
            }
        }
        return res
    }
}
// @lc code=end

