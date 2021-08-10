/*
 * @lc app=leetcode.cn id=49 lang=swift
 *
 * [49] 字母异位词分组
 */

// @lc code=start
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard strs.count > 0 else {
            return []
        }
        var map = [String: [String]]()
        for str in strs {
            let sort = String(str.sorted())
            if map[sort] != nil {
               map[sort]!.append(str) 
            } else {
                var v = [String]()
                v.append(str)
                map[sort] = v
            }
        }
        return Array(map.values)
    }
}
// @lc code=end

