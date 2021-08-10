/*
 * @lc app=leetcode.cn id=242 lang=swift
 *
 * [242] 有效的字母异位词
 *
 * https://leetcode-cn.com/problems/valid-anagram/description/
 *
 * algorithms
 * Easy (60.07%)
 * Likes:    210
 * Dislikes: 0
 * Total Accepted:    112.6K
 * Total Submissions: 186.4K
 * Testcase Example:  '"anagram"\n"nagaram"'
 *
 * 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
 * 
 * 示例 1:
 * 
 * 输入: s = "anagram", t = "nagaram"
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入: s = "rat", t = "car"
 * 输出: false
 * 
 * 说明:
 * 你可以假设字符串只包含小写字母。
 * 
 * 进阶:
 * 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 * 
 */

// @lc code=start
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var ans1: UInt32 = 1, ans2: UInt32 = 1
        var sum1: UInt32 = 0, sum2: UInt32 = 0
        for c in s.unicodeScalars {
            ans1 = ans1*c.value % UInt32(100000)
            sum1 += c.value
        }
        for c in t.unicodeScalars {
            ans2 = ans2*c.value % UInt32(100000)
            sum2 += c.value
        }
        return ans1 == ans2 && sum1 == sum2
    }
    
    // func isAnagram(_ s: String, _ t: String) -> Bool {
    //     guard s.count == t.count else {
    //         return false
    //     }
    //     let maps = makeMap(s)
    //     let mapt = makeMap(t)
    //     for i in maps {
    //         if mapt[i.key] != i.value {
    //             return false
    //         }
    //     }
        
    //     return true
    // }
    
    // private func makeMap(_ s: String ) -> [Character: Int] {
    //     var res = [Character: Int]()
    //     s.forEach { (c) in
    //         if let v = res[c] {
    //             res[c] = v + 1
    //         } else {
    //             res[c] = 1
    //         }
    //     }
    //     return res
    // }
}
// @lc code=end

