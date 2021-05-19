//
//  415. 字符串相加.swift
//  INTERVIEW
//
//  Created by 钱志新(平安科技快乐平安团队iOS开发组) on 2020/8/3.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//num1 和num2 的长度都小于 5100.
//num1 和num2 都只包含数字 0-9.
//num1 和num2 都不包含任何前导零。
//你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式。


class Solution_415 {
    func addStrings(_ num1: String, _ num2: String) -> String {
        if num2.count > num1.count {
            return addStrings(num2, num1)
        }
        guard num1.count != 0 && num2.count != 0 else {
            return num1.count == 0 ? num2 : num1
        }
        var nums1 = Array(num1) //更长
        let nums2 = Array(num2) // 短一点的
        var i1 = nums1.count - 1, i2 = nums2.count - 1, carray = 0
        while i1 >= 0 {
            let v1 = nums1[i1].hexDigitValue ?? 0
            var v2 = 0
            if i2 >= 0 {
                v2 = nums2[i2].hexDigitValue ?? 0
            }
            let left = (v1 + v2 + carray) % 10
            carray = (v1 + v2 + carray) / 10
            nums1[i1] = Character("\(left)")
            i1 -= 1
            i2 -= 1
        }
        if carray > 0 {
            return String(carray) + String(nums1)
        }
        return String(nums1)
    }
}
