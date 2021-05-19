//
//  290.单词规律.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/6/29.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_290 {
    //双map实现，1 位置相同 2、单词相同
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let strArray = str.split(separator:" ")
        let patArray = pattern.map({return String($0)})
        guard strArray.count == patArray.count else {
            return false
        }
        var map_1 = [Substring: String]()
        var map_2 = [String : Substring]()
        for (i, stg) in patArray.enumerated() {
            let sub = strArray[i]
            if let pc = map_1[sub], pc != stg {
                return false
            } else if let pc = map_2[stg], pc != sub   {
                return false
            } else {
                map_1[sub] = stg
                map_2[stg] = sub
            }
        }
        
        return true
    }
    
    func wordPattern_1(_ pattern: String, _ str: String) -> Bool {
        guard str.count > 1 && pattern.count > 0 else {
            return pattern.count == str.count
        }
        let strArray = str.split(separator: " ")
        let patArray = pattern.map { return String($0) }
        guard strArray.count ==  pattern.count else {
            return false
        }
        var dict = [String : Substring]()
        for (index, value) in patArray.enumerated() {
            if dict.keys.contains(value) {
                if dict[value] != strArray[index] {
                    return false
                }
            } else {
                if dict.values.contains(strArray[index]) {
                    return false
                }
                dict[value] = strArray[index]
            }
        }
        return true
    }
}
