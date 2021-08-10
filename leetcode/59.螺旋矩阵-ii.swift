/*
 * @lc app=leetcode.cn id=59 lang=swift
 *
 * [59] 螺旋矩阵 II
 *
 * https://leetcode-cn.com/problems/spiral-matrix-ii/description/
 *
 * algorithms
 * Medium (77.41%)
 * Likes:    202
 * Dislikes: 0
 * Total Accepted:    39K
 * Total Submissions: 50.3K
 * Testcase Example:  '3'
 *
 * 给定一个正整数 n，生成一个包含 1 到 n^2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。
 * 
 * 示例:
 * 
 * 输入: 3
 * 输出:
 * [
 * ⁠[ 1, 2, 3 ],
 * ⁠[ 8, 9, 4 ],
 * ⁠[ 7, 6, 5 ]
 * ]
 * 
 */

// @lc code=start
class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = Array<[Int]>()
        for _ in 0 ..< n {
            let item = Array(repeating:0, count: n)
            res.append(item)
        }
        var sum = 1, l2r = 0, r2l = n - 1, t2b = 0, b2t = n - 1
        while sum <= n * n {
            for i in l2r ... r2l {
                res[t2b][i] = sum
                sum += 1
            }
            t2b += 1
            if t2b > b2t {
                break
            }
            for i in t2b ... b2t {
                res[i][r2l] = sum
                sum += 1
            }
            r2l -= 1
            var i = r2l ?? 0
            while i >= l2r {
                res[b2t][i] = sum
                sum += 1
                i -= 1
            }
            b2t -= 1
            i = b2t ?? 0
            while i >= t2b {
                res[i][l2r] = sum
                sum += 1
                i -= 1
            }
            l2r += 1
        }
        return res
    }
}
// @lc code=end

