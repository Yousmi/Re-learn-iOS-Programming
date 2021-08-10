/*
 * @lc app=leetcode.cn id=106 lang=swift
 *
 * [106] 从中序与后序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/description/
 *
 * algorithms
 * Medium (68.64%)
 * Likes:    236
 * Dislikes: 0
 * Total Accepted:    42K
 * Total Submissions: 60.8K
 * Testcase Example:  '[9,3,15,20,7]\n[9,15,7,20,3]'
 *
 * 根据一棵树的中序遍历与后序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 中序遍历 inorder = [9,3,15,20,7]
 * 后序遍历 postorder = [9,15,7,20,3]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0 && inorder.count == postorder.count else {
            return nil
        }
        var map = [Int: Int]()
        for (i, v) in inorder.enumerated() {
            map[v] = i
        }
        func build(_ si: Int, _ ei: Int, _ sp:Int, _ ep: Int) -> TreeNode? {
            if si > ei {
                return nil
            }
            let rootv = postorder[ep]
            let rootIndex = map[rootv] ?? si
            let res = TreeNode(rootv)
            let count = rootIndex - si
            res.left = build(si, rootIndex - 1, sp, sp + count - 1)
            res.right = build(rootIndex + 1, ei, sp + count, ep - 1)
            return res
        }
        return build(0, inorder.count - 1, 0, postorder.count - 1)
    }
    
    func buildTree_2(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0 else {
            return nil
        }
        let root = TreeNode(postorder[postorder.count - 1])
        for i in 0 ..< inorder.count {
            if inorder[i] == postorder[postorder.count - 1] {

                let inLeft = Array<Int>(inorder[0 ..< i])
                let inRight = Array<Int>(inorder[i + 1 ..< inorder.count])

                let poLeft = Array<Int>(postorder[0 ..< i])
                let poRight = Array<Int>(postorder[i ..< postorder.count - 1])

                root.left = buildTree(inLeft, poLeft);
                root.right = buildTree(inRight, poRight);
                break
            }
        }
        return root
    }

    func buildTree_1(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0 || inorder.count == postorder.count else {
            return nil
        }
        var map = [Int: Int]()
        for i in 0 ..< inorder.count {
            map[inorder[i]] = i
        }
        return buildItem_2(inorder, 0, inorder.count - 1, postorder, 0,postorder.count - 1, map)
    }
    
    private func buildItem_2(_ inorder: [Int], _ ibegin: Int, _ iend: Int, _ postorder: [Int], _ pbegin: Int, _ pend: Int, _ map:[Int: Int]) -> TreeNode? {
        if iend < ibegin || pend < pbegin {
            
            return nil
        }
        let root = TreeNode(postorder[pend])
        let rootIndexInorder = map[root.val] ?? ibegin
        root.left = buildItem_2(inorder, ibegin, rootIndexInorder - 1, postorder, pbegin, rootIndexInorder - ibegin + pbegin - 1, map)
        
        root.right = buildItem_2(inorder, rootIndexInorder + 1, iend, postorder, rootIndexInorder - ibegin + pbegin, pend - 1, map)
        return root
    }
}
// @lc code=end

