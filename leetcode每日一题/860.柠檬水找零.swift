//
//  860.柠檬水找零.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/19.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
class Solution_860 {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        guard bills.count > 0 && bills.first == 5 else {
            return true
        }
        
        var deque = [Int]()
        for i in 0 ..< bills.count {
            let v = bills[i]
            if v == 5 {
                deque.append(v)
            } else if v == 10 {
                let last = deque.popLast()
                if let last = last, last == 5 {
                    deque.insert(v, at: 0)
                } else {
                    return false
                }
            } else if v == 20 {
                if deque.count >= 2 {
                    let first = deque.removeFirst()
                    var last = deque.popLast()
                    if let last = last, last == 10 {
                        return false
                    } else if (first == 5) {
                        last = deque.popLast()
                        guard last != nil else {
                            return false
                        }
                    }
                } else {
                    return false
                }
            }
        }
    
        return true
    }
    
    func lemonadeChange_1(_ bills: [Int]) -> Bool {
        guard bills.count > 0 && bills[0] == 5 else {
            return false
        }
        
        var five = 0, ten = 0
        for i in bills {
            if i == 5 {
                five += 1
            } else if i == 10 {
                if five > 0 {
                    five -= 1
                    ten += 1
                } else {
                    return false
                }
            } else if  i == 20 {
                if five > 0 && ten > 0 {
                    ten -= 1
                    five -= 1
                } else if five >= 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }
        return true
    }
}
