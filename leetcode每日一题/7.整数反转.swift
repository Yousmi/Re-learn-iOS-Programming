//
//  7.整数反转.swift
//  INTERVIEW
//
//  Created by 钱志新  on 2020/6/7.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation


class Solution_7 {
    func reverse(_ x: Int) -> Int {
        var input = x
        var ans = 0
        while input != 0 {
            let pop = input % 10
            if ((ans > Int32.max / 10) || (ans == Int32.max / 10 && pop > 7))  {
                return 0
            }
            
            if ((ans < Int32.min / 10) || (ans == Int32.min / 10 && pop < -8)) {
                return 0
            }
            
            ans = ans * 10 + pop
            input = input / 10
        }
        return ans
    }
}
