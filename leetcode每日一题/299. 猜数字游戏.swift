//
//  299. 猜数字游戏.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/28.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_299 {
    func getHint(_ secret: String, _ guess: String) -> String {
        guard guess.count > 0 else {
            return "0A0B"
        }
        var map:[Character : Int] = [:]
        var a = 0, b = 0
        for i in secret.indices {
            if secret[i] == guess[i] {
                a += 1
            } else {
                if map[secret[i], default: 0] < 0 {
                    b += 1
                }
                map[secret[i], default: 0] += 1
                if map[guess[i], default: 0] > 0 {
                    b += 1
                }
                map[guess[i], default: 0] -= 1
            }
        }
        return "\(a)A\(b)B"
        
        /*
        guard secret.count == guess.count else {
            return ""
        }
        var x = 0, y = 0
        let s = Array(secret), g = Array(guess)
        
        var left = [Character]()
        var sMap = [Character : Int]()//这个是次数
        var matchMap = [Int : Character]()
        
        for i in 0 ..< secret.count {
            if s[i] == g[i] {
                matchMap[i] = g[i]
                x += 1
            } else {
                sMap[s[i]] =  sMap[s[i]] == nil ? 1 : sMap[s[i]]! + 1
                left.append(g[i])
            }
        }
        
        for c in left {
            if sMap[c] != nil {
                y += 1
                sMap[c] = sMap[c]! - 1
                if sMap[c] == 0 {
                    sMap[c] = nil
                }
            }
        }
        return "\(x)A\(y)B"
        */
    }
}
