//
//  1.两数之和.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/22.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_1{
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var res:[Int] = [Int]()
        var map:[Int: Int] = [Int: Int]()

        for (i, v) in nums.enumerated() {
            let lv = target - v

            if map[lv] != nil {
                res.append(map[lv]!)
                res.append(i)
            } else {
                map[v] = i
            }
            
            map[v] = i
        }
        return res
    }
}
