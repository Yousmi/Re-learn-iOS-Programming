//
//  412.Fizz Buzz.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_412 {
    func fizzBuzz(_ n: Int) -> [String] {
        var res = [String]()
        guard n > 0 else {
            return res
        }
        for i in 1 ... n {
            let san = i % 3
            let wu = i % 5
            if san == 0 || wu == 0 {
                if san == 0 && wu == 0 {
                    res.append("FizzBuzz")
                } else {
                    res.append(san == 0 ? "Fizz" : "Buzz")
                }
            } else {
                res.append(String(i))
            }
        }
        return res
    }
    
    func fizzBuzz_1(_ n: Int) -> [String] {
        var res = [String]()
        for i in 1 ... n {
            var resItem = ""
            let san = i % 3
            let wu = i % 5
            if  san == 0 || wu == 0 {
                resItem = san == 0 ? "Fizz" : "Buzz"
                resItem = (san == 0 && wu == 0) ? "FizzBuzz" : resItem
            } else {
                resItem = String(i)
            }
            res += [resItem]
        }
        return res
    }
}
