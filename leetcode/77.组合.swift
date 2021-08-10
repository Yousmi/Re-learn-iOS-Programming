/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 *
 * https://leetcode-cn.com/problems/combinations/description/
 *
 * algorithms
 * Medium (73.68%)
 * Likes:    310
 * Dislikes: 0
 * Total Accepted:    60.3K
 * Total Submissions: 81.3K
 * Testcase Example:  '4\n2'
 *
 * 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。
 * 
 * 示例:
 * 
 * 输入: n = 4, k = 2
 * 输出:
 * [
 * ⁠ [2,4],
 * ⁠ [3,4],
 * ⁠ [2,3],
 * ⁠ [1,2],
 * ⁠ [1,3],
 * ⁠ [1,4],
 * ]
 * 
 */

// @lc code=start
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k > 0 && n >= k else {
            return []
        }
        var res = [[Int]](), arr = [Int]()
        func backTrack(_ begin: Int, _ level: Int) {
            if arr.count == k {
                res.append(arr)
                return
            }
            if n - begin + 1 < level {
                return
            }
            backTrack(begin + 1, level)
            arr.append(begin)
            backTrack(begin + 1, level - 1)
            _ = arr.popLast()
        }
        backTrack(1, k)
        return res
    }
}
// @lc code=end

