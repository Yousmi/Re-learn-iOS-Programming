/*
 * @lc app=leetcode.cn id=385 lang=swift
 *
 * [385] 迷你语法分析器
 *
 * https://leetcode-cn.com/problems/mini-parser/description/
 *
 * algorithms
 * Medium (39.22%)
 * Likes:    28
 * Dislikes: 0
 * Total Accepted:    3.1K
 * Total Submissions: 8K
 * Testcase Example:  '"324"'
 *
 * 给定一个用字符串表示的整数的嵌套列表，实现一个解析它的语法分析器。
 * 
 * 列表中的每个元素只可能是整数或整数嵌套列表
 * 
 * 提示：你可以假定这些字符串都是格式良好的：
 * 
 * 
 * 字符串非空
 * 字符串不包含空格
 * 字符串只包含数字0-9, [, - ,, ]
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 给定 s = "324",
 * 
 * 你应该返回一个 NestedInteger 对象，其中只包含整数值 324。
 * 
 * 
 * 
 * 
 * 示例 2：
 * 
 * 
 * 给定 s = "[123,[456,[789]]]",
 * 
 * 返回一个 NestedInteger 对象包含一个有两个元素的嵌套列表：
 * 
 * 1. 一个 integer 包含值 123
 * 2. 一个包含两个元素的嵌套列表：
 * ⁠   i.  一个 integer 包含值 456
 * ⁠   ii. 一个包含一个元素的嵌套列表
 * ⁠        a. 一个 integer 包含值 789
 * 
 * 
 * 
 * 
 */

// @lc code=start
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func deserialize(_ s: String) -> NestedInteger {
        
        for chr in s {
            if chr == "[" {

            }else if chr == "," {

            }else if chr == "]" {

            }else {
                s.
            }
        }
    }
}
// @lc code=end

