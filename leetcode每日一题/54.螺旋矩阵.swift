//
//  54.螺旋矩阵.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/10.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_54 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 {
            return []
        }
        var res = [Int]()
        let m = matrix.count, n = matrix[0].count, level = (min(m, n) + 1) / 2
            
        var i = 0
        while i < level {
            
            for j in i ..< n - i { //右
                res.append(matrix[i][j])
            }
            
            for j in (i+1) ..< m - i {//下
                res.append(matrix[j][(n-1)-i])
            }
            
            var j = (n - 1) - (i + 1)
            while j >= 0 {
                if j >= i && (m-1) - i != i {
                    res.append(matrix[(m-1) - i][j])
                }
                j -= 1
            }
            
            j = (m - 1) - (i + 1)
            while j >= 0 {
                if j >= i+1 && (n-1) - i != i {
                   res.append(matrix[j][i])
                }
                j -= 1
            }
            i += 1
        }
        return res
    }
}
