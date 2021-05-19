//
//  151.翻转字符串里的单词.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/10.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_151 {
    func reverseWords(_ s: String) -> String {
        guard s.count > 0 else {
            return s
        }
        var temp = [[Character]]()
        temp.append([Character]())
        var indexT = 0
        for i in s.indices {
            if s[i] != " " {
                if indexT == temp.count {
                    temp.append([Character]())
                }
                temp[indexT].append(s[i])
            } else {
                if indexT < temp.count && temp[indexT].count > 0 {
                    indexT += 1
                }
            }
        }
        
        var i = 0
        indexT = temp.count - 1
        while i < indexT {
            temp.swapAt(i, indexT)
            i += 1
            indexT -= 1
        }
        return String(temp.joined(separator: " "))
    }
    
    func reverseWords_3(_ s: String) -> String {
        guard s.count > 0 else {
            return s
        }
        var i = 0, j = 0
        var temp = [Character]()
        deleteSpace(s, &temp)
        
        reverse(&temp, 0, temp.count - 1)
        temp.append(" ")
        while i < temp.count {
            if temp[i] == " " {
                reverse(&temp, j, i - 1)
                j = i + 1
            }
            i += 1
        }
        temp.removeLast()
        return String(temp)
    }

    private func deleteSpace(_ s: String, _ res: inout [Character]) {
        let arr = Array(s)
        for i in 0 ..< arr.count {
            if arr[i] == " " {
                if res.last != nil && res.last! != " " {
                    res.append(" ")
                }
            } else {
                res.append(arr[i])
            }
        }
        if let last = res.last, last == " " {
            _ = res.removeLast()
        }
    }

    private func reverse(_ arr: inout [Character], _ left: Int, _ right: Int) {
        var left = left, right = right
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
    func reverseWords_2(_ s: String) -> String {
        return (s.split(separator: " ").filter({$0.count != 0})).reversed().joined(separator: " ")
    }
    
    func reverseWords_1(_ s: String) -> String {
        var tempArr = Array<Character>(" ")
        tempArr.append(contentsOf: s)
        tempArr.append(" ")
        reves(&tempArr)
        var res = "", item = [Character](), i = 0
        while i < tempArr.count {
            if tempArr[i] !=  " " {
                item.append(tempArr[i])
            } else if !item.isEmpty {
                reves(&item)
                res += String(item)
                res += " "
                item.removeAll()
            }
            i += 1
        }
        if res != "" {
            res.removeLast()
        }
        return res
    }
    
    private func reves(_ temp: inout [Character]) {
        var l = 0, r = temp.count - 1
        while l < r {
            temp.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}
