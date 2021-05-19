//
//  200.岛屿数量.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/22.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
// dfs(i + 1, j) //下
// dfs(i - 1, j) //上
// dfs(i, j + 1) //右
// dfs(i, j - 1) //左
class Solution_200 {
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
