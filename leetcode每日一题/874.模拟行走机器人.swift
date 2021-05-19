//
//  874.模拟行走机器人.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
class Solution_874 {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        let dir = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        var curx = 0, cury = 0, res = 0
        var curdir = 0
        var set = Set<String>()
        for i in 0 ..< obstacles.count {
            set.insert(String(obstacles[i][0]) + "," + String(obstacles[i][1]))
        }
        for i in 0 ..< commands.count {
            if commands[i] == -1 {
                curdir = (curdir + 1) % 4
            } else if commands[i] == -2 {
                curdir = (curdir + 3) % 4
            } else {
                for _ in 0 ..< commands[i] {
                    let n_x = curx + dir[curdir][0]
                    let n_y = cury + dir[curdir][1]
                    if set.contains(String(n_x) + "," + String(n_y)) {
                        break
                    } else {
                        curx = n_x
                        cury = n_y
                        res = max(res, curx * curx + cury * cury)
                    }
                }
            }
        }
        return res
    }
}
