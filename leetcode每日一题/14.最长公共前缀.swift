//
//  14.最长公共前缀.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_14 {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 1 else {
            return strs.first ?? ""
        }
        var res = ""
        let sorted = strs.sorted()
        let tempArr = Array(sorted.last!)
        for (i, c) in sorted.first!.enumerated() {
            if c == tempArr[i] {
                res += String(c)
            } else {
                break
            }
        }
        
        return res
    }

    
    private func getCommonPre(_ str1: String, _ str2: String) -> String {
        let minStr = str1.count > str2.count ? str2 : str1
        let maxStr = str1.count > str2.count ? str1 : str2
        let tempArr = Array(maxStr)
        var idex = -1
        for (i, c) in minStr.enumerated() {
            if c == tempArr[i] {
                idex = i
            } else {
                break
            }
        }
        return idex != -1 ? String(tempArr[0...idex]) : ""
    }
}
