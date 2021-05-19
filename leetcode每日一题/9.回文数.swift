//
//  9.回文数.swift
//  INTERVIEW
//
//  Created by 钱志新  on 2020/6/7.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_9 {
    func isPalindrome(_ x: Int) -> Bool {
        
        if x <= 0 || (x % 10  == 0) {
            return false
        }
        var temp:Int = x;
        var rev: Int = 0;
        while temp > rev  {
            let pop = temp % 10
            rev = rev * 10 + pop
            temp = temp / 10
        }
        
        
        return temp == rev || temp == rev / 10
    }
}
