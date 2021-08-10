/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 *
 * algorithms
 * Medium (67.08%)
 * Likes:    561
 * Dislikes: 0
 * Total Accepted:    93.8K
 * Total Submissions: 139.1K
 * Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
 *
 * 根据一棵树的前序遍历与中序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 前序遍历 preorder = [3,9,20,15,7]
 * 中序遍历 inorder = [9,3,15,20,7]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 && preorder.count == inorder.count else {
            return nil
        }
        var map = [Int: Int]()
        for (i, v) in inorder.enumerated() {
            map[v] = i
        }
        func build(_ ps: Int, _ pe: Int, _ si: Int, _ ei: Int) -> TreeNode? {
            if ps > pe {
                return nil
            }
            let rootv = preorder[ps]
            let rootIndex = map[rootv] ?? ps
            let count = rootIndex - si
            
            let res = TreeNode(rootv)
            res.left = build(ps + 1, ps + count, si, rootIndex - 1)
            res.right = build(ps + 1 + count, pe, rootIndex + 1, ei)
            return res
        }
        return build(0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    func buildTree_1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count == inorder.count && inorder.count > 0  else {
            return nil
        }
        var map = [Int : Int]()
        for (i, v) in inorder.enumerated() {
            map[v] = i
        }
        return _buildItem(map, preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }
    
    private func _buildItem(_ map: [Int : Int], _ preorder: [Int], _ p_start: Int, _ p_end: Int, 
                                                _ inorder: [Int], _ i_start: Int, _ i_end: Int) -> TreeNode? {
        if  p_end < p_start {
            return nil
        }
        let root_val = preorder[p_start]
        let res = TreeNode(root_val)
        
        let root_index = map[root_val] ?? 0
        let leftCount = root_index - i_start
        
        res.left = _buildItem(map, preorder, p_start + 1, p_start + leftCount, inorder, i_start, root_index - 1)
        res.right = _buildItem(map, preorder, p_start + leftCount + 1, p_end, inorder, root_index + 1, i_end)
        return res
    }
}
// @lc code=end

