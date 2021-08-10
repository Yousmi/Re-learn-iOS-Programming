/*
 * @lc app=leetcode.cn id=110 lang=swift
 *
 * [110] 平衡二叉树
 *
 * https://leetcode-cn.com/problems/balanced-binary-tree/description/
 *
 * algorithms
 * Easy (51.89%)
 * Likes:    376
 * Dislikes: 0
 * Total Accepted:    90K
 * Total Submissions: 171.7K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，判断它是否是高度平衡的二叉树。
 * 
 * 本题中，一棵高度平衡二叉树定义为：
 * 
 * 
 * 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
 * 
 * 
 * 示例 1:
 * 
 * 给定二叉树 [3,9,20,null,null,15,7]
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 返回 true 。
 * 
 * 示例 2:
 * 
 * 给定二叉树 [1,2,2,3,3,null,null,4,4]
 * 
 * ⁠      1
 * ⁠     / \
 * ⁠    2   2
 * ⁠   / \
 * ⁠  3   3
 * ⁠ / \
 * ⁠4   4
 * 
 * 
 * 返回 false 。
 * 
 * 
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return dfs(root) != -1
    }
    
    private func dfs(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = dfs(root?.left)
        let right = dfs(root?.right)
        if abs(left - right) > 1 || right == -1 || left == -1 {
            return -1
        }
        return max(left, right) + 1
    }

    // func isBalanced(_ root: TreeNode?) -> Bool {
    //     if root == nil {
    //         return true
    //     }
    //     let left = maxDep(root?.left)
    //     let right = maxDep(root?.right)
    //     if abs(left - right) >= 2 {
    //         return false
    //     }
    //     return isBalanced(root?.left) && isBalanced(root?.right)
    // }
    // private func maxDep(_ root: TreeNode?) -> Int {
    //     if root == nil {
    //         return 0
    //     }
    //     let left = maxDep(root?.left)
    //     let right = maxDep(root?.right)
    //     return max(left, right) + 1
    // }

    // func isBalanced(_ root: TreeNode?) -> Bool {
    //     var l = [[Int]](), r = [[Int]]()
    //     _level(root?.left, &l, 0)
    //     _level(root?.right, &r, 0)
    //     return  abs(l.count - r.count) <= 1
    // }
    
    // private func _level(_ root: TreeNode?, _ res: inout [[Int]], _ level: Int) {
    //     if root == nil {
    //         return
    //     }
    //     if level == res.count {
    //         let tem = [Int]()
    //         res.append(tem)
    //     }
    //     res[level].append(root!.val)
    //     if let left = root?.left {
    //         _level(left, &res, level + 1)
    //     }
    //     if let right = root?.right {
    //         _level(right, &res, level + 1)
    //     }
    // }
}
// @lc code=end

