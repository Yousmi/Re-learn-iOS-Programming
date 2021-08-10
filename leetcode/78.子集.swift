/*
 * @lc app=leetcode.cn id=78 lang=swift
 *
 * [78] 子集
 */

// @lc code=start
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        func backTrack(_ temp: [Int], _ level: Int) {
            res.append(temp)
            for i in level ..< nums.count {
                var temp = temp 
                temp.append(nums[i])
                backTrack(temp, i + 1)
                temp.removeAll()
            }
        }
        backTrack([], 0)
        return res
    }
    func subsets_1(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        for i in nums {
            for item in res {
                var temp = item
                temp.append(i)
                res.append(temp)
            }
            res.append([i])
        }
        res.append([])
        return res
    }
}
// @lc code=end

