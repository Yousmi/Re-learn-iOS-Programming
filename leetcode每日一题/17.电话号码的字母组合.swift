//
//  17.电话号码的字母组合.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
//
//给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
class Solution_17 {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }
        let map:[Character: String] = [
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        var queue:[String] = [""]
        for key in digits {
            for _ in 0 ..< queue.count {
                let head = queue.removeFirst()
                if let val = map[key] {
                    for str in val {
                        queue.append(head + "\(str)")
                    }
                } else {
                    return []
                }
            }
        }
        return queue
    }

    func letterCombinations_1(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }
        let map:[Character: String] = [
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        let temp = [Character](digits)
        var res = [String]()
        func backTrack(_ str:String, _ level: Int) {
            if str.count == temp.count {
                res.append(str)
                return
            }
            if let val = map[temp[level]] {
                for i in val.indices {
                    backTrack(str + "\(val[i])", level + 1)
                }
            } else {
                return
            }
        }
        backTrack("", 0)
        return res
    }
}
