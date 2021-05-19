//
//  面试题 16.01. 交换数字.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/15.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

//编写一个函数，不用临时变量，直接交换numbers = [a, b]中a与b的值。
class Solution_16_01 {
    func swapNumbers(_ numbers: [Int]) -> [Int] {
        var numbers = numbers
        numbers[0] = numbers[0] ^ numbers[1]
        numbers[1] = numbers[0] ^ numbers[1]
        numbers[0] = numbers[0] ^ numbers[1]
        return numbers
    }
}
