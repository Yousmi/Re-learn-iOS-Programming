/*
 * @lc app=leetcode.cn id=226 lang=swift
 *
 * [226] 翻转二叉树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        let left = root?.left
        root?.left = invertTree(root?.right)
        root?.right = invertTree(left)
        return root
    }
    
    func invertTree_1(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }
        _invertTree(root)
        return root
    }
    private func _invertTree(_ root: TreeNode?) {
        if root == nil {
            return
        }
        let left: TreeNode? = root?.left ?? nil
        let right: TreeNode? = root?.right ?? nil
        root?.left = right
        root?.right = left
        _invertTree(left)
        _invertTree(right)
    }
}
// @lc code=end

