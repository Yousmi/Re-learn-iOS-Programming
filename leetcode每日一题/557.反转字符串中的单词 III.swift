//
//  557.反转字符串中的单词 III.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
class Solution_557 {
    func reverseWords(_ s: String) -> String {
        var i = 0
        var sarr = Array(s)
        sarr.append(" ")
        for j in 0 ..< sarr.count{
            if sarr[j] == " " {
                reverse(&sarr, i, j - 1)
                i = j+1
            }
        }
        sarr.removeLast()
        return String(sarr)
    }
    
    private func reverse(_ arr: inout [Character], _ left: Int, _ right: Int) {
        var left = left, right = right
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    /*
    func reverseWords(_ s: String) -> String {
        guard s.count > 0 else {
            return s
        }
        var arr:[Character] = Array(s)
        arr.append(" ")
        var res = [Character](), result = ""
        var left = 0
        while left < arr.count {
            if arr[left] == " " {
                if res.count > 0 {
                    swap(&res)
                    result += String(res)
                    res.removeAll()
                }
                if left != arr.count - 1 {
                    result += String(arr[left])
                }
            } else {
                res.append(arr[left])
            }
            
            left += 1
        }
        return result
    }
    
    private func swap(_ arr: inout [Character]) {
        var left = 0, right = arr.count - 1
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    */
}
