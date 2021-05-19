//
//  10.正则表达式匹配.swift
//  Interview
//
//  Created by Scan on 2020/6/14.
//  Copyright © 2020 Scan. All rights reserved.
//

// '.' 匹配任意单个字符
// 'x.' 匹配x后面有任意长度字符
// 'x.y' 匹配 x后，y前 有任意长度字符

// '*' 匹配零个或多个前面的那一个元素
// 'x*' 匹配x 出现 零个或多个
// '*x' 匹配零个或多个前面的那一个元素 这种不可能  * 前面一定有字符

// '.*' 表示可匹配零个或多个（'*'）任意字符（'.'）
// 'x.*' 表示可匹配 x 有 零个或 多个 任意字符
// 'x*.' 匹配零个或多个前面的那一个元素,后面带有任意长度字符
// 'x*.y' 匹配零个或多个前面的那一个元素,后面带有任意长度字符
import Foundation

class Solution_10 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        guard s.count > 0 else {
            return false
        }
        guard p.count > 0 else {
            return false
        }
        
        var containDotOrX = false
        for (i, c) in s.enumerated() {
            if i == 0 && c == "*" {
                return false
            }
            if c == "." || c == "*" {
                containDotOrX = true
                break
            }
        }
        
        if !containDotOrX {
            return s == p
        }
        
        var stack = Array(s) //先进的先出
        let mach = Array(p)
        
        var i = 0
        var nextLetterIndex  = 0;
        while i < mach.count && i+1 < mach.count {
            let c_i = mach[i]
            let c_i_j = mach[i+1]
            
            if c_i == "." && c_i_j == "*" {
                var fist_c = i + 1;
                var containc = false
                while fist_c < mach.count {
                    if mach[fist_c] != "*" || mach[fist_c] != "." {
                        containc = true
                        nextLetterIndex = fist_c;
                    }
                    fist_c += 1
                }
            }
            
            i += 1
        }
        
        
        
        
        
        
        
        
        return false
    }
}
