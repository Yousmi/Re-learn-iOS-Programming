//
//  Z字形变换.swift
//  INTERVIEW
//
//  Created by 钱志新  on 2020/6/7.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if s.count < 2 || numRows < 2 {
            return s
        }
        var store = [String](repeating: "", count: numRows)
        
        var strIndex = 0
        var shouldReturn = false
        for c in s {
            store[strIndex].append(c)
            strIndex = shouldReturn ?(strIndex - 1) : (strIndex + 1)
            if strIndex + 1 == numRows {
                shouldReturn = true
            }else if (strIndex == 0) {
                shouldReturn = false
            }
        }
        
        return store.joined()
    }
}
