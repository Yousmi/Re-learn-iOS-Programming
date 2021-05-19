//
//  66.加一.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_66 {
    func plusOne(_ digits: [Int]) -> [Int] {
        guard digits.count > 0 else {
            return [1]
        }
        var res = [Int]()
        var j = digits.count - 1
        var shouldUp = false
        var nextup = 1
        
        while j >= 0 {
            let i = digits[j]
            let n = (i + nextup) / 10
            let m = (i + nextup) % 10
            if n > 0 {
                shouldUp = true
                res.insert(m, at: 0)
                nextup = n
            } else {
                shouldUp = false
                res.insert(i + nextup, at: 0)
                nextup = 0
            }
            
            j -= 1
        }
        
        if shouldUp {
            res.insert(1, at: 0)
        }
        
        return res
    }
}

//MARK: - 第二遍

class Solution_66_1 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var res = digits
        var nextup = 1
        var sum = 0
        for i in 0..<digits.count {
            let last = digits.count - 1 - i
            sum = res[last] + nextup
            res[last] = sum % 10
            nextup = sum / 10
        }
        
        if nextup > 0 {
            res.insert(1, at: 0)
        }
        
        return res
    }
}

//MARK: - 第三遍
class Solution_66_2 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var res = digits
        var carry = 0
        var i = res.count - 1
        while i >= 0 {
            let j = res[i]
            carry = (j + carry) / 10
            if i == res.count - 1 {
                carry = (j + 1) / 10
            }
            if carry != 1 {
                res[i] = j + 1
                break
            } else {
                res[i] = (j + carry) % 10
            }
            i -= 1
        }
        if carry > 0 {
            res.insert(carry, at: 0)
        }
        return res
    }
}
