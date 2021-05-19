//
//  28实现 strStr().swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/21.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        let hLen = haystack.count
        let nLen = needle.count
        if nLen == 0 {return 0}
        if hLen < nLen { return -1}

        let offsetHold = hLen - nLen

        for i in 0...offsetHold {
            let stIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: i + nLen)

            if haystack[stIndex..<endIndex] == needle {
                return i
            }
        }
        return -1
        
    }
    
    func strStr_1(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {
            return 0
        }
        let hay = Array(haystack), nee = Array(needle)
        var i = 0, j = 0
        while i < hay.count && j < nee.count {
            if hay[i] == nee[j] {
                i += 1
                j += 1
            } else {
                i = i - j + 1 //这个就回去了
                j = 0
            }
        }
        
        if j == nee.count {
            return i - j
        }
        
        return -1
    }
}
