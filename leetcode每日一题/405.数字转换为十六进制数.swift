//
//  405.数字转换为十六进制数.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/8/11.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_405 {
    private let map = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
    func toHex(_ num: Int) -> String {
        if num == 0 && (num > Int32.max || num <= Int32.min) {
            return "0"
        }
        var res = ""
        dfs(num, &res, 0)
        return res
    }

    private func dfs(_ num: Int, _ res: inout String, _ count: Int) {
        if num == 0  || count == 8 {
            return
        }
        res = map[num & 15] + res
        dfs(num >> 4, &res, count + 1)
    }
}
