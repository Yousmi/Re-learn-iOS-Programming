//
//  1021.删除最外层的括号.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_1021 {
    func removeOuterParentheses(_ S: String) -> String {
        var arr = [Character]()
        var leftIndex = 0
        for c in S {
            if c == "(" {
                if leftIndex != 0 {
                    arr.append(c)
                }
                leftIndex += 1
            } else {
                leftIndex -= 1
                if leftIndex != 0 {
                    arr.append(c)
                }
            }
        }
        return String(arr)
    }
    
    func removeOuterParentheses_2(_ S: String) -> String {
        var res:[Character] = []
        var count = 0
        for c in S {
            if c == "(" {
                if count > 0 {
                    res.append(c)
                }
                count += 1
            } else {
                count -= 1
                if count > 0 {
                    res.append(c)
                }
            }
        }
        return String(res)
    }
    
    func removeOuterParentheses_1(_ S: String) -> String {
        var stack = [Character]()
        var res = ""
        var l = 0, r = 0
        for (i, v) in S.enumerated() {
            if v == "(" {
                if stack.isEmpty {
                    l = i
                }
                stack.append(v)
            }
            if !stack.isEmpty && v == ")"  {
                _ = stack.popLast()
            }
            if stack.isEmpty {
                r = i
                if l != r - 1 {
                    let start = S.index(S.startIndex, offsetBy: l + 1)
                    let end = S.index(S.startIndex, offsetBy: r - 1)
                    res += S[start ... end]
                }
            }
        }
        return res
    }
}
