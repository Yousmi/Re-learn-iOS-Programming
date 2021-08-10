/*
 * @lc app=leetcode.cn id=213 lang=swift
 *
 * [213] 打家劫舍 II
 */

// @lc code=start
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums.first!
        }
        let res1 = myRob(Array(nums[1..<nums.count]))
        let res2 = myRob(Array(nums[0..<nums.count - 1]))
        return max(res1, res2)
    }
    
    private func myRob(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0, temp = 0
        for n in 0 ..< nums.count {
            temp = cur;
            cur = max(pre + nums[n], cur)
            pre = temp
        }
        return cur
    }
}
// @lc code=end

