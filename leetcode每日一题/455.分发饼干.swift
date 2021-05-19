//
//  455.分发饼干.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/19.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
class Solution_455 {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        guard s.count > 0 else {
            return 0
        }
        var gi = 0, si = 0, res = 0
        let tg = g.sorted(), ts = s.sorted()
        while gi < g.count && si < s.count {
            let appetite = tg[gi]
            var cookie = ts[si]
            while cookie - appetite < 0 {
                si += 1
                if si < s.count {
                    cookie = ts[si]
                } else {
                    return res
                }
            }
            si += 1
            res += 1
            gi += 1
            
        }
        return res
    }
    
    
    
    
    
    
    
    
    
    
    func findContentChildren_1(_ g: [Int], _ s: [Int]) -> Int {
        guard g.count > 0 && s.count > 0 else {
            return 0
        }
        var res = 0, gi = 0, si = 0
        let tg = g.sorted(), ts = s.sorted()
        while gi < tg.count && si < ts.count {
            var gv = tg[gi], sv = ts[si]
            while sv - gv > 0 {
                gi += 1
                if gi < tg.count {
                    gv = tg[gi]
                } else {
                    return res
                }
            }
            
            res += 1
            gi += 1
            si += 1
        }
        return res
    }
}
