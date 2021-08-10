/*
 * @lc app=leetcode.cn id=589 lang=swift
 *
 * [589] N叉树的前序遍历
 *
 * https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/description/
 *
 * algorithms
 * Easy (73.08%)
 * Likes:    78
 * Dislikes: 0
 * Total Accepted:    27K
 * Total Submissions: 37K
 * Testcase Example:  '[1,null,3,2,4,null,5,6]'
 *
 * 给定一个 N 叉树，返回其节点值的前序遍历。
 * 
 * 例如，给定一个 3叉树 :
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 返回其前序遍历: [1,3,5,6,2,4]。
 * 
 * 
 * 
 * 说明: 递归法很简单，你可以使用迭代法完成此题吗?
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {

    func preorder(_ root: Node?) -> [Int] {
        guard root != nil else {
            return []
        }
        //利用栈的特点，逆向添加进去
        // 根  1 、 2  =》根  1 、 2
        var res = [Int](), stack = [Node]()
        stack.append(root!)
        while stack.count > 0 {
            let node = stack.popLast()!
            res.append(node.val)
            let c = node.children.count
            if c > 0 {
                for i in 0 ..< c {
                    stack.append(node.children[c - i - 1])
                }
            }
        }
        return res
    }






    // func preorder(_ root: Node?) -> [Int] {
    // 	if root == nil {
    //         return []
    //     }
    //     var res = [Int]()
    //     res.append(root!.val)
    //     if root!.children.count > 0 {
    //         for i in root!.children {
    //             let t = preorder(i)
    //             res.append(contentsOf: t)
    //         }
    //     }
    //     return res
    // }
}
// @lc code=end

