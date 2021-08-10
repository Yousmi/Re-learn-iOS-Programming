/*
 * @lc app=leetcode.cn id=136 lang=swift
 *
 * [136] 只出现一次的数字
 */

// @lc code=start
class Solution {

    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result = result^num
        }
        return result
    }

    // func singleNumber(_ nums: [Int]) -> Int {
    //     guard nums.count > 0 else {
    //         return 0
    //     }
    //     var map = [Int: Int]()//key 是值， value也是值
    //     for i in nums {
    //         if map[i] != nil {
    //             map[i] = nil
    //         } else {
    //             map[i] = i
    //         }
    //     }
    //     return map.values.first ?? 0
    // }

    // func singleNumber(_ nums: [Int]) -> Int {
    //     guard nums.count > 2 else {
    //         return nums.first ?? 0
    //     }
        
    //     var res = 0
    //     let temp = nums.sorted()
    //     var i = 0
    //     while i < temp.count - 2 {
    //         if temp[i] == temp[i + 1] {
    //             res = temp[i+2]
    //         } else if temp[i + 1] == temp[i + 2] {
    //             return temp[i]
    //         }
    //         i = i + 2
    //     }
        
    //     return res
    // }
    
}
// @lc code=end

