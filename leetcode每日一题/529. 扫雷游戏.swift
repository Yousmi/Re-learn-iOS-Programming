//
//  529. 扫雷游戏.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/22.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_529 {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let dx = [-1, 1, 0, 0, -1, 1, -1, 1], dy = [0, 0, -1, 1, -1, 1, 1, -1]
        var board = board
        let x = click[0], y = click[1]
        if board[x][y] == "M" {
            board[x][y] = "X"
        } else {
            func dfs(_ x: Int, _ y: Int) {
                var count = 0
                for i in 0 ..< 8 {
                    let tx = x + dx[i], ty = y + dy[i]
                    if tx < 0 || tx >= board.count || ty < 0 || ty >= board[0].count {
                        continue
                    }
                    if board[tx][ty] == "M" {
                        count += 1
                    }
                }
                if count > 0 {
                    board[x][y] = Character("\(count)")
                } else {
                    board[x][y] = "B"
                    for i in 0 ..< 8 {
                        let tx = x + dx[i], ty = y + dy[i]
                        if tx < 0 || tx >= board.count || ty < 0 || ty >= board[0].count || board[tx][ty] != "E" {
                            continue
                        }
                        dfs(tx, ty)
                    }
                }
            }
            dfs(x, y)
        }
        return board
    }
}
