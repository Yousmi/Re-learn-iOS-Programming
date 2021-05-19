/*
 * @lc app=leetcode.cn id=98 lang=swift
 *
 * [98] 验证二叉搜索树
 *
 * https://leetcode-cn.com/problems/validate-binary-search-tree/description/
 *
 * algorithms
 * Medium (31.13%)
 * Likes:    591
 * Dislikes: 0
 * Total Accepted:    122.5K
 * Total Submissions: 392.1K
 * Testcase Example:  '[2,1,3]'
 *
 * 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 * 
 * 假设一个二叉搜索树具有如下特征：
 * 
 * 
 * 节点的左子树只包含小于当前节点的数。
 * 节点的右子树只包含大于当前节点的数。
 * 所有左子树和右子树自身必须也是二叉搜索树。
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * ⁠   2
 * ⁠  / \
 * ⁠ 1   3
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * ⁠   5
 * ⁠  / \
 * ⁠ 1   4
 * / \
 * 3   6
 * 输出: false
 * 解释: 输入为: [5,1,4,null,null,3,6]。
 * 根节点的值为 5 ，但是其右子节点值为 4 。
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
class Solution_98 {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return reve(root, nil, nil)
    }

    private func reve(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        if root == nil {
            return true
        }
        if let min = min,min >= root!.val {
            return false
        }
        if let max = max,max <= root!.val {
            return false
        }

        return reve(root?.left,min, root?.val) && reve(root?.right, root?.val, max)
    }
    
    
    func isValidBST_1(_ root: TreeNode?) -> Bool {
        return _helper(root, nil, nil)
    }

    private func _helper(_ node: TreeNode?, _ min:Int?, _ max: Int?) -> Bool {
        guard let node = node else {//节点为nil 时，也是二叉搜索树
            return true
        }

        if let min = min, node.val <= min {//如果左边的大于了，就return
            return false
        }
        if let max = max, node.val >= max {//如果右边的小于了，就return
            return false
        }

        return _helper(node.left, min, node.val) && _helper(node.right, node.val, max)
    }
}
// @lc code=end

