//
//  79.单词搜索.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
//给定一个二维网格和一个单词，找出该单词是否存在于网格中。
//
//单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
class Solution_79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard word.count > 0 else {
            return false
        }
        var arr = Array(word)
        let shuiping_lenght = board[0].count
        let cuizhi_lenght = board.count
        
        
        return false
    }
}
