/*
 * @lc app=leetcode.cn id=632 lang=swift
 *
 * [632] 最小区间
 *
 * https://leetcode-cn.com/problems/smallest-range-covering-elements-from-k-lists/description/
 *
 * algorithms
 * Hard (37.72%)
 * Likes:    114
 * Dislikes: 0
 * Total Accepted:    3.2K
 * Total Submissions: 7.9K
 * Testcase Example:  '[[4,10,15,24,26],[0,9,12,20],[5,18,22,30]]'
 *
 * 你有 k 个升序排列的整数数组。找到一个最小区间，使得 k 个列表中的每个列表至少有一个数包含在其中。
 * 
 * 我们定义如果 b-a < d-c 或者在 b-a == d-c 时 a < c，则区间 [a,b] 比 [c,d] 小。
 * 
 * 示例 1:
 * 
 * 
 * 输入:[[4,10,15,24,26], [0,9,12,20], [5,18,22,30]]
 * 输出: [20,24]
 * 解释: 
 * 列表 1：[4, 10, 15, 24, 26]，24 在区间 [20,24] 中。
 * 列表 2：[0, 9, 12, 20]，20 在区间 [20,24] 中。
 * 列表 3：[5, 18, 22, 30]，22 在区间 [20,24] 中。
 * 
 * 
 * 注意:
 * 
 * 
 * 给定的列表可能包含重复元素，所以在这里升序表示 >= 。
 * 1 <= k <= 3500
 * -10^5 <= 元素的值 <= 10^5
 * 对于使用Java的用户，请注意传入类型已修改为List<List<Integer>>。重置代码模板后可以看到这项改动。
 * 
 * 
 */

// @lc code=start
class Solution {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        let size = nums.count
        var map = [Int: [Int]](), xMin = Int.max, xMax = Int.min
        for i in 0 ..< size {
            for x in nums[i] {
                var item: [Int]?
                if let v = map[x] {
                    item = v
                } else {
                    item = [Int]()
                }
                item!.append((i))
                map[x] = item!
                xMin = min(xMin, x)
                xMax = max(xMax, x)
            }
        }
        var freq = [Int](repeating: 0, count: size)
        var inside = 0, left = xMin, right = xMin - 1
        var bLeft = xMin, bRight = xMax
        while right < xMax {
            right += 1
            if map.keys.contains(right) {
                for x in map[right]! {
                    freq[x] += 1
                    if freq[x] == 1 {
                        inside += 1
                    }
                }
                while inside == size {
                    if right - left < bRight - bLeft {
                        bLeft = left
                        bRight = right
                    }
                    if map.keys.contains(left) {
                        for x in map[left]! {
                            freq[x] -= 1
                            if freq[x] == 0 {
                                inside -= 1
                            }
                        }
                    }
                    left += 1
                }
            }
        }
        return [bLeft, bRight]
    }
}
// @lc code=end

