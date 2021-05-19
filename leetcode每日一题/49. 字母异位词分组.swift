//
//  49. 字母异位词分组.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/4.
//  Copyright © 2020 钱志新. All rights reserved.
//
//给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
//输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
//输出:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]

import Foundation

//给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。

class Solution_49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
       guard strs.count > 0 else {
           return []
       }
       var map = [String: [String]]()
       for str in strs {
           let sort = String(str.sorted())
           if map[sort] != nil {
              map[sort]!.append(str)
           } else {
               var v = [String]()
               v.append(str)
               map[sort] = v
           }
       }
       return Array(map.values)
    }
}
