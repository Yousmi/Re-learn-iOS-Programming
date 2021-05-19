//
//  304. 二维区域和检索 - 矩阵不可变.swift
//  INTERVIEW
//
//  Created by Scan on 2021/3/2.
//  Copyright © 2021 钱志新. All rights reserved.
//

import Foundation

class NumMatrix {
    private var inner = [[Int]]()
    init(_ matrix: [[Int]]) {
        
        let row = matrix.count
        if row > 0 {
            let col = matrix[0].count
            inner = Array(repeating: [], count: row + 1)
            for i in 0 ... row {
                inner[i] = Array(repeating: 0, count: col + 1)
            }
            for  i in 0 ..< row {
                for j in 0 ..< col {
                    inner[i + 1][j + 1] = inner[i][j + 1] + inner[i + 1][j] + matrix[i][j] - inner[i][j]
                }
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return inner[row2 + 1][col2 + 1] - inner[row1][col2 + 1] - inner[row2 + 1][col1] + inner[row1][col1]
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
