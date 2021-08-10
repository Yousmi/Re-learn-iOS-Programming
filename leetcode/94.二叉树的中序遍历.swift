/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-inorder-traversal/description/
 *
 * algorithms
 * Medium (71.40%)
 * Likes:    493
 * Dislikes: 0
 * Total Accepted:    156.3K
 * Total Submissions: 218.9K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的中序 遍历。
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
 * 输出: [1,3,2]
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
    //前序遍历  自己   -》 左子树  -》 右子树
    //中序遍历  左子树 -》 自己    -》 右子树
    //后序遍历  左子树 -》 右子树  -》 自己
 */
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] { //迭代
        var res = [Int]()
        var temp = root
        var stack = [TreeNode]()
        while stack.count > 0 || temp != nil {
            while temp != nil {
                stack.append(temp!)
                temp = temp?.left
            }
            temp = stack.popLast()
            res.append(temp!.val)
            temp = temp?.right
        }
        return res
    }

    // func inorderTraversal(_ root: TreeNode?) -> [Int] { //递归
    //     if root == nil {
    //         return []
    //     }
        
    //     var res = [Int]()
    //     treeNodeVal(root, &res)
    //     return res
    // }

    // private func treeNodeVal(_ node: TreeNode?, _ res: inout [Int]) {
    //     //terminator   
    //     if  node == nil {
    //         return
    //     }    

    //     //process
    //     if node?.left != nil {
    //         treeNodeVal(node?.left, &res)
    //     }

    //     res.append(node!.val)

    //     // print("\(node!.val)")
        
    //     if node?.right != nil {
    //         treeNodeVal(node?.right, &res)
    //     }

    //     //drill down 

    //     //clear status
    // }
}
// @lc code=end

