/*
 * @lc app=leetcode.cn id=114 lang=swift
 *
 * [114] 二叉树展开为链表
 *
 * https://leetcode-cn.com/problems/flatten-binary-tree-to-linked-list/description/
 *
 * algorithms
 * Medium (69.09%)
 * Likes:    496
 * Dislikes: 0
 * Total Accepted:    72.5K
 * Total Submissions: 102.2K
 * Testcase Example:  '[1,2,5,3,4,null,6]'
 *
 * 给定一个二叉树，原地将它展开为一个单链表。
 * 
 * 
 * 
 * 例如，给定二叉树
 * 
 * ⁠   1
 * ⁠  / \
 * ⁠ 2   5
 * ⁠/ \   \
 * 3   4   6
 * 
 * 将其展开为：
 * 
 * 1
 * ⁠\
 * ⁠ 2
 * ⁠  \
 * ⁠   3
 * ⁠    \
 * ⁠     4
 * ⁠      \
 * ⁠       5
 * ⁠        \
 * ⁠         6
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func flatten(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        var queue: [TreeNode] = [root!]
        var tmp: TreeNode?
        while queue.count > 0 {
            let node = queue.removeLast()
            if let right = node.right {
                queue.append(right)
            }
            if let left = node.left {
                queue.append(left)
            }
            if tmp == nil {
                tmp = node
            } else {
                tmp?.left = nil
                tmp?.right =  node
                tmp = tmp?.right
            }
        }
    }

    func flatten_1(_ root: TreeNode?) {
        guard root != nil else {
            return
        }
        var res = [TreeNode]()
        preOrder(root, &res)
        conv2Link(root, &res)
    }
    private func preOrder(_ root: TreeNode?, _ res: inout [TreeNode]) {
        if root == nil {
            return
        }
        res.append(root!)
        if let left = root?.left {
            preOrder(left, &res)
        }
        if let right = root?.right {
            preOrder(right, &res)
        }
    }
    private func conv2Link(_ root: TreeNode?, _ res: inout [TreeNode]) {
        var cur = root
        for i in 1 ..< res.count {
            let node = res[i]
            cur?.left = nil
            cur?.right = node
            cur = node
        }
    }
}
// @lc code=end

