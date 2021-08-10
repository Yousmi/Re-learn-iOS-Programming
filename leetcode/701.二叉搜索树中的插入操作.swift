/*
 * @lc app=leetcode.cn id=701 lang=swift
 *
 * [701] 二叉搜索树中的插入操作
 *
 * https://leetcode-cn.com/problems/insert-into-a-binary-search-tree/description/
 *
 * algorithms
 * Medium (73.40%)
 * Likes:    73
 * Dislikes: 0
 * Total Accepted:    16.7K
 * Total Submissions: 22.9K
 * Testcase Example:  '[4,2,7,1,3]\n5'
 *
 * 给定二叉搜索树（BST）的根节点和要插入树中的值，将值插入二叉搜索树。 返回插入后二叉搜索树的根节点。 保证原始二叉搜索树中不存在新值。
 * 
 * 注意，可能存在多种有效的插入方式，只要树在插入后仍保持为二叉搜索树即可。 你可以返回任意有效的结果。
 * 
 * 例如, 
 * 
 * 
 * 给定二叉搜索树:
 * 
 * ⁠       4
 * ⁠      / \
 * ⁠     2   7
 * ⁠    / \
 * ⁠   1   3
 * 
 * 和 插入的值: 5
 * 
 * 
 * 你可以返回这个二叉搜索树:
 * 
 * 
 * ⁠        4
 * ⁠      /   \
 * ⁠     2     7
 * ⁠    / \   /
 * ⁠   1   3 5
 * 
 * 
 * 或者这个树也是有效的:
 * 
 * 
 * ⁠        5
 * ⁠      /   \
 * ⁠     2     7
 * ⁠    / \   
 * ⁠   1   3
 * ⁠        \
 * ⁠         4
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

    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
       if root == nil  { return TreeNode(val) }
        var node: TreeNode = root!
        if node.val > val {
            node.left = insertIntoBST(node.left, val)
        } else if (node.val < val)  {
            node.right = insertIntoBST(node.right, val)
        }
        return node
    }

    func insertIntoBST_2(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
        insert(root, val)
        return root
    }
    private func insert(_ root: TreeNode?, _ val: Int) {
        if root?.left == nil && root?.right == nil {
            let node = TreeNode(val)
            (root!.val > val) ? (root?.left = node) : (root?.right = node)
        } else if root?.left == nil || root?.right == nil {
            if root?.left != nil {
                if val > root!.val {
                    root?.right = TreeNode(val)
                } else {
                    insert(root?.left, val)   
                }
            } else {
                if val < root!.val {
                    root?.left = TreeNode(val)
                } else {
                    insert(root?.right, val)
                }
            }
        } else {
            insert(val > root!.val ? root?.right : root?.left, val)
        }
    }

    func insertIntoBST_1(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
        dfsInsert(root, val)
        return root
    }

    private func dfsInsert(_ root: TreeNode?, _ val: Int) {
        if root?.left == nil && root?.right == nil {
            (val > root!.val) ? (root?.right = TreeNode(val)) : (root?.left = TreeNode(val)) 
            return
        }
        if root?.left == nil || root?.right == nil {
            if val > root!.val {
                if root?.right != nil {
                    dfsInsert(root?.right, val)
                } else {
                    root?.right = TreeNode(val)
                }
            } else {
                if root?.left != nil {
                    dfsInsert(root?.left, val)
                } else {
                    root?.left = TreeNode(val)
                }
            }
            return
        }
        dfsInsert(val > root!.val ? root?.right : root?.left, val)
    }
}
// @lc code=end

