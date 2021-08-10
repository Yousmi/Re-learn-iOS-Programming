/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-level-order-traversal/description/
 *
 * algorithms
 * Medium (62.89%)
 * Likes:    556
 * Dislikes: 0
 * Total Accepted:    154.5K
 * Total Submissions: 245.1K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
 * 
 * 
 * 
 * 示例：
 * 二叉树：[3,9,20,null,null,15,7],
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 
 * 返回其层次遍历结果：
 * 
 * [
 * ⁠ [3],
 * ⁠ [9,20],
 * ⁠ [15,7]
 * ]
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var res = [[Int]]()
        func dfs(_ root: TreeNode?, _ level:Int) {
            if root == nil {
                return 
            }
            if level == res.count {
                res.append([Int]())
            }
            res[level].append(root!.val)
            dfs(root?.left, level + 1)
            dfs(root?.right, level + 1)
        } 
        dfs(root, 0)
        return res
    }
    func levelOrder_1(_ root: TreeNode?) -> [[Int]] {
        //bfs
        guard root != nil else {
            return []
        }
        var queue = [TreeNode](), res = [[Int]]()
        queue.append(root!)
        while !queue.isEmpty {
           var item = [Int]()
           for _ in 0 ..< queue.count {
               let temp = queue.removeFirst()
               item.append(temp.val)
               if let left = temp.left {
                   queue.append(left)
               }
               if let right = temp.right {
                   queue.append(right)
               }
           }
           res.append(item)
        }
        return res
    }
}
// @lc code=end

