//
//  88. 合并两个有序数组.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var l = m - 1, r = n - 1, t = m + n - 1
        while  l >= 0 && r >= 0 {
            let n1 = nums1[l]
            let n2 = nums2[r]
            if n1 >= n2 {
                nums1[t] = n1
                l -= 1
            } else {
                nums1[t] = n2
                r -= 1
            }
            t -= 1
        }
        
        while r >= 0 {
            nums1[t] = nums2[r]
            t -= 1
            r -= 1
        }
    }
}
