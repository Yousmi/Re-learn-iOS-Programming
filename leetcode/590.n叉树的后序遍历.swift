/*
 * @lc app=leetcode.cn id=590 lang=swift
 *
 * [590] N叉树的后序遍历
 *
 * https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/description/
 *
 * algorithms
 * Easy (73.62%)
 * Likes:    82
 * Dislikes: 0
 * Total Accepted:    27.1K
 * Total Submissions: 36.7K
 * Testcase Example:  '[1,null,3,2,4,null,5,6]'
 *
 * 给定一个 N 叉树，返回其节点值的后序遍历。
 * 
 * 例如，给定一个 3叉树 :
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 返回其后序遍历: [5,6,3,2,4,1].
 * 
 * 
 * 
 * 说明: 递归法很简单，你可以使用迭代法完成此题吗?
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func postorder(_ root: Node?) -> [Int] {
    	guard root != nil else {
            return []
        }
        var res = [Int](), stack = [Node]()
        stack.append(root!)
        while stack.count > 0 {
            let last = stack.popLast()!
            res.insert(last.val, at:0)
            for item in last.children {
                stack.append(item)
            }
        }
        return res
    }

    func postorder_1(_ root: Node?) -> [Int] {
    	guard root != nil else {
            return []
        }
        var stack = [Node](), res = [Int]()
        stack.append(root!)
        while stack.count > 0 {
            let last = stack.popLast()!
            res.append(last.val)
            if last.children.count > 0 {
                for i in 0 ..< last.children.count {
                    stack.append(last.children[i])
                }                
            }
        }
        return res.reversed()
    }
}
// @lc code=end

