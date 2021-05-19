//
//  43. 字符串相乘.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/13.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_43 {
    //该算法是通过两数相乘时，乘数某位与被乘数某位相乘，与产生结果的位置的规律来完成。具体规律如下：
    // - 乘数 num1 位数为 MM，被乘数 num2 位数为 NN， num1 x num2 结果 res 最大总位数为 M+N
    // - num1[i] x num2[j] 的结果为 tmp(位数为两位，"0x","xy"的形式)，其第一位位于 res[i+j]，第二位位于 res[i+j+1]。
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        var res = [Int](repeating:0, count: num1.count + num2.count)
        let arr1 = [Character](num1), arr2 = [Character](num2)
        var i1 = arr1.count - 1
        while i1 >= 0 {
            let in1 = Int(String(arr1[i1])) ?? 0
            var i2 = arr2.count - 1
            while i2 >= 0 {
                let in2 = Int(String(arr2[i2])) ?? 0
                let sum = (res[i1 + i2 + 1] + in1 * in2)
                res[i1 + i2 + 1] = sum % 10
                res[i1 + i2] += sum / 10
                i2 -= 1
            }
            i1 -= 1
        }
        var rest = ""
        for i in 0..<res.count {
            if i == 0 && res[i] == 0 {
                continue
            }
            rest += String(res[i])
        }
        return rest
    }
}
