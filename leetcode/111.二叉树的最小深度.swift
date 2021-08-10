/*
 * @lc app=leetcode.cn id=111 lang=swift
 *
 * [111] 二叉树的最小深度
 *
 * https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/description/
 *
 * algorithms
 * Easy (42.54%)
 * Likes:    297
 * Dislikes: 0
 * Total Accepted:    93.7K
 * Total Submissions: 218.1K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，找出其最小深度。
 * 
 * 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 * 
 * 说明: 叶子节点是指没有子节点的节点。
 * 
 * 示例:
 * 
 * 给定二叉树 [3,9,20,null,null,15,7],
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 返回它的最小深度  2.
 * 
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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root?.left == nil && root?.right == nil {
            return 1
        }
        let left = minDepth(root?.left) + 1
        let right = minDepth(root?.right) + 1
        if root?.left == nil || root?.right == nil {
            return max(left, right)
        }
        return min(left, right)
    }

    func minDepth_2(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if root!.left == nil && root!.right == nil {
            return 1
        }
        let left = minDepth(root?.left)
        let right = minDepth(root?.right)
        if root!.left == nil || root!.right == nil {
            return max(left, right) + 1
        }
        return min(left, right) + 1
    }

    func minDepth_1(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        return bfs(root)
    }

    private func bfs(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var queue = [TreeNode](), res = 0
        queue.append(root!) 

        while !queue.isEmpty {
            res += 1
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil {
                    return res
                }
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return res
    }
}
// @lc code=end

