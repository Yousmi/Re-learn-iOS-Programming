//
//  59.螺旋矩阵 II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/10.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_59 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = [[Int]]()
        for _ in 0 ..< n {
            let item = [Int](repeating: 0, count: n)
            res.append(item)
        }
        var l = 0, r = n - 1, t = 0, b = n - 1
        var num = 1, tag = n * n
        while num <= tag {
            for  i in l ... r {
                res[t][i] = num
                num += 1
            }
            t += 1
            
            if t > b {
                break
            }
            for i in  t ... b {
                res[i][r] = num
                num += 1
            }
            r -= 1
            
            var i = r
            while i >= l {
                res[b][i] = num
                num += 1
                i -= 1
            }
            b -= 1
            
            i = b
            while i >= t {
                res[i][l] = num
                num += 1
                i -= 1
            }
            l += 1
        }
        return res
    }
}
