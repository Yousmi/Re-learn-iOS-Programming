//
//  3.无重复字符的最长子串.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int  {
        guard s.count > 0 else {
            return 0
        }
        let arr = Array(s)
        var left = 0, right = 0, res = 0
        while right < arr.count {
            var i = left
            while i < right {
                if arr[i] == arr[right] {
                    left = i + 1
                    break
                }
                i += 1
            }
            res = max(res, right - left + 1)
            right += 1
        }
        return res
    }

    func theLongestSubstring(_ s: String) -> String  {
        guard s.count > 0 else {
            return s
        }
        var idx = 0, left = 0
        var res = [Character]()
        let arr = Array(s)
        for i in 1 ..< arr.count {
            for j in idx ..< i {
                if arr[i] == arr[j] {
                    idx = j + 1
                    left = idx
                    break
                }
            }
            let temp = Array(arr[left ... i])
            res = temp.count > res.count ? temp : res
        }
        return String(res)
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int  {
        guard s.count > 0 else {
            return 0
        }
        var res = 0, left = 0
        var map = [Character: Int]()
        for (i, v) in s.enumerated() {
            if let j = map[v] {
                left = max(left, j + 1)
            }
            map[v] = i
            res = max(res, i - left + 1)
        }
        return res
    }
    //这个也很好
    func lengthOfLongestSubstring_3(_ s: String) -> Int  {
        guard s.count > 0 else {
            return 0
        }
        var res = 1, j = 0
        let temp = Array(s)
        for i in 1 ..< temp.count {
            for k in j ..< i {
                if temp[i] == temp[k] {
                    j = k + 1
                    break
                }
            }
            res = max(res, i - j + 1)
        }
        return res
    }
    //这个很快
    func lengthOfLongestSubstring_4(_ s: String) -> Int  {
        var map = [Character: Int]()
        var start = 0, end = 0, res = 0, counter = 0
        let temp = Array(s)
        while end < temp.count {
            if let ind = map[temp[end]], ind > 0 {
                counter += 1
            }
            map[temp[end]] = (map[temp[end]] ?? 0) + 1
            end += 1
            while  counter > 0 {
                if let ind = map[temp[start]], ind > 1 {
                    counter -= 1
                }
                map[temp[start]] = (map[temp[start]] ?? 0) - 1
                start += 1
            }
            res = max(res, end - start)
        }
        return res
    }
    
    func lengthOfLongestSubstring_5(_ s: String) -> Int {
    
        var map = [Character : Int]()
        var res = 0
        var start = 0
        for (i, c) in s.enumerated() {
            if let v = map[c] {
                start = max(v + 1, start)
            }
            res = max(res, i - start + 1)
            map[c] = i
        }
        return res
    }
    
    func lengthOfLongestSubstring_1(_ s: String) -> Int {
        // O(n) - 空间   O(n2) - 时间
        var stack = Array<Character>()
        var result = 0
        for c in s {
         let index = stack.firstIndex(of: c)
         if let index = index {
             stack.removeSubrange(0...index)
         }
         stack.append(c)
         result = max(result, stack.count)
        }

        return result
    }
    
    func lengthOfLongestSubstring_2(_ s: String) -> Int  {
        guard s.count > 0 else {
            return 0
        }
        var res = 0, queue = [Character](), queueMap = [Character: Int]()
        for (_, v) in s.enumerated() {
            if queueMap[v] != nil { //已经有过了
                var j = 0
                while j < queue.count {
                    if v == queue[j] {
                        queue.removeSubrange((0...j))
                        break
                    }
                    j += 1
                }
            } else {
                queueMap[v] = 1
            }
            queue.append(v)
            res = max(res, queue.count)
        }
        
        return res
    }
}
