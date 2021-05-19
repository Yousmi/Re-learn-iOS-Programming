//
//  567.字符串的排列.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/3.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
//给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。
class Solution_567 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        let s1Arr = Array(s1)
        let s2Arr = Array(s2)
        var font = true, back = true
        
        for (i, v) in s2Arr.enumerated() {
            if v == s1Arr[0] { //找到第一个相同的元素了
                var begin = 0
                while begin < s1Arr.count {
                    if s1Arr[begin] != s2Arr[i - begin ]  {
                        back = false
                        break
                    }
                    begin += 1
                }
                begin = s1Arr.count - 1
                while begin > 0 && i - (s1Arr.count - begin) > 0 {
                    if s1Arr[s1Arr.count - begin] != s2Arr[i - (s1Arr.count - begin)]  {
                        back = false
                        break
                    }
                    begin -= 1
                }
            }
        }
        
        return (font||back)
    }
}
