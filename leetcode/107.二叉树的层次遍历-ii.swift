/*
 * @lc app=leetcode.cn id=107 lang=swift
 *
 * [107] 二叉树的层次遍历 II
 *
 * https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/description/
 *
 * algorithms
 * Easy (65.44%)
 * Likes:    238
 * Dislikes: 0
 * Total Accepted:    59.5K
 * Total Submissions: 90.8K
 * Testcase Example:  '[3,9,20,null,null,15,7]'
 *
 * 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 * 
 * 例如：
 * 给定二叉树 [3,9,20,null,null,15,7],
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 
 * 返回其自底向上的层次遍历为：
 * 
 * [
 * ⁠ [15,7],
 * ⁠ [9,20],
 * ⁠ [3]
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var res = [[Int]]()

        var array = [TreeNode]()
        array.append(root)
        while array.count > 0 {

            let size = array.count
            var level = [Int]()
            for _ in 0 ..< size {

                let node = array.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    array.append(left)
                }
                if let right = node.right {
                    array.append(right)
                }
            }
            // res.insert(level, at: 0) //要这个就不要下面的交换
            res.append(level)
        }
        /*
        var i = 0, j = res.count - 1;
        while i < j {
            (res[i], res[j]) = (res[j], res[i])
            i+=1
            j-=1
        }

        return res
        */
        return res.reversed()
    }
}
// @lc code=end

