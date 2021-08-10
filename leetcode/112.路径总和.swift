/*
 * @lc app=leetcode.cn id=112 lang=swift
 *
 * [112] 路径总和
 *
 * https://leetcode-cn.com/problems/path-sum/description/
 *
 * algorithms
 * Easy (51.02%)
 * Likes:    410
 * Dislikes: 0
 * Total Accepted:    127.9K
 * Total Submissions: 250.6K
 * Testcase Example:  '[5,4,8,11,null,13,4,7,2,null,null,null,1]\n22'
 *
 * 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 * 
 * 说明: 叶子节点是指没有子节点的节点。
 * 
 * 示例: 
 * 给定如下二叉树，以及目标和 sum = 22，
 * 
 * ⁠             5
 * ⁠            / \
 * ⁠           4   8
 * ⁠          /   / \
 * ⁠         11  13  4
 * ⁠        /  \      \
 * ⁠       7    2      1
 * 
 * 
 * 返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {
            return false
        }
        func dfs(_ root: TreeNode?, _ sum: Int, _ levelSum: Int) -> Bool {
            //terminator
            if root == nil {
                return false
            }
            //cur level logic
            var curSum = levelSum + root!.val
            if curSum == sum && root?.left == nil && root?.right == nil  {
                return true
            } else {
                //drill down
                let leftRes = dfs(root?.left, sum, curSum)
                let rightRes = dfs(root?.right, sum, curSum)
                //reverse status
                curSum -= root!.val
                return leftRes || rightRes
            }
        }
        return dfs(root, sum, 0)
    }
}
// @lc code=end

