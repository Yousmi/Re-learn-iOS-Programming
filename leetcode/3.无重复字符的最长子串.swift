/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * [3] 无重复字符的最长子串
 */

// @lc code=start
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int  {
        guard s.count > 0 else {
            return 0
        }
        var map = [Character: Int]()
        var res = 0, left = 0
        for (i, v) in s.enumerated() {
            if let exist = map[v] {
                left = max(left, exist + 1) //abba
            }
            map[v] = i
            res = max(res, i - left + 1)
        }
        return res
    }
    
    func lengthOfLongestSubstring_6(_ s: String) -> Int  {
        guard s.count > 0 else {
            return 0
        }
        var map = [Character: Int]()
        var res = 0, left = 0 
        for (i, v) in s.enumerated() {
            if let ind = map[v] {
                left = max(left, ind + 1)
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
// @lc code=end

