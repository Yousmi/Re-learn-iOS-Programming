/*
 * @lc app=leetcode.cn id=46 lang=swift
 *
 * [46] 全排列
 */

// @lc code=start
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return []
        }
        var res = [[Int]](), temp = [Int]()
        var visited = [Bool](repeating: false, count: nums.count)
        func dfs(_ level: Int) {
            if level == nums.count {
                res.append(temp)
                return
            }
            for i in 0 ..< nums.count {
                if !visited[i] { 
                    visited[i] = true
                    temp.append(nums[i])
                    dfs(level + 1)
                    _ = temp.popLast()
                    visited[i] = false
                }
            }
        }
        dfs(0)
        return res
    }
    func permute_1(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return []
        }
        var res = [[Int]]()
        func dfs(_ arr:[Int], _ level: Int) {
            if level == nums.count {
                res.append(arr)
                return
            }
            for i in 0 ..< nums.count {
                if !arr.contains(nums[i]) { //这里满足不了有相同的元素 虽然可以 AC
                    var arr = arr
                    arr.append(nums[i])
                    dfs(arr, level + 1)
                    arr.removeAll()
                }
            }
        }
        dfs([], 0)
        return res
    }
}
// @lc code=end

