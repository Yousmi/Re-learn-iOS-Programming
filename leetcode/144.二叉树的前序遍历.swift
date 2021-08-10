/*
 * @lc app=leetcode.cn id=144 lang=swift
 *
 * [144] 二叉树的前序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-preorder-traversal/description/
 *
 * algorithms
 * Medium (65.52%)
 * Likes:    256
 * Dislikes: 0
 * Total Accepted:    103.8K
 * Total Submissions: 158.5K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的 前序 遍历。
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
 * 输出: [1,2,3]
 * 
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var res = [Int](), stack = [TreeNode].init(arrayLiteral: root!)
        while stack.count > 0 {
            let temp = stack.popLast()!
            res.append(temp.val)
            if temp.right != nil {
                stack.append(temp.right!)
            }
            if temp.left != nil {
                stack.append(temp.left!)
            }
        }
        return res
    }

    // func preorderTraversal(_ root: TreeNode?) -> [Int] {
    //     guard root != nil else {
    //         return []
    //     }
    //     var stack = [TreeNode](), res = [Int]()
    //     stack.append(root!)
    //     while stack.count > 0 {
    //         let last = stack.popLast()!
    //         res.append(last.val)
    //         if last.right != nil {
    //             stack.append(last.right!)
    //         }
    //         if last.left != nil {
    //             stack.append(last.left!)
    //         }
    //     }
    //     return res
    // }



    // func preorderTraversal(_ root: TreeNode?) -> [Int] {
    //     guard let root = root else {
    //         return []
    //     }
    
    //     var res: [Int] = []
    //     rere(root, res: &res)
    //     return res
    // }

    // private func rere(_ node: TreeNode?, res: inout [Int]) {
    //     if node != nil {
    //         res.append(node!.val)
    //         rere(node!.left, res: &res)
    //         rere(node!.right, res: &res)
    //     }
    // }
}
// @lc code=end

