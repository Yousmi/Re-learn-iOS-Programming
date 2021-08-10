/*
 * @lc app=leetcode.cn id=145 lang=swift
 *
 * [145] 二叉树的后序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-postorder-traversal/description/
 *
 * algorithms
 * Hard (71.37%)
 * Likes:    295
 * Dislikes: 0
 * Total Accepted:    77K
 * Total Submissions: 108K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的 后序 遍历。
 * 
 * 示例:
 * 
 * 输入: [1,null,2,3]  
 * ⁠  1
 * ⁠   \
 * ⁠    2
 * ⁠   /
 * ⁠  3 
 * 
 * 输出: [3,2,1]
 * 
 * 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
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

    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res : [Int] = []
        if root == nil{
            return []
        }
        var nodeArray : [TreeNode] = [root!];
        while nodeArray.count > 0 {
            let node = nodeArray.popLast()
            res.insert(node!.val, at: 0)
            if node?.left != nil {
                nodeArray.append(node!.left!)
            }
            if node?.right != nil {
                nodeArray.append(node!.right!)
            }
        }
        return res
    }
    // func postorderTraversal(_ root: TreeNode?) -> [Int] {
    //     guard let root = root else {
    //         return []
    //     }
    
    //     var res: [Int] = []
    //     rere(root, res: &res)
    //     return res
    // }

    // private func rere(_ node: TreeNode?, res: inout [Int]) {
    //     if node != nil {
    //         rere(node!.left, res: &res)
    //         rere(node!.right, res: &res)
    //         res.append(node!.val)
    //     }
    // }
}
// @lc code=end

