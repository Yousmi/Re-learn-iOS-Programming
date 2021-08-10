/*
 * @lc app=leetcode.cn id=1008 lang=swift
 *
 * [1008] 先序遍历构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-search-tree-from-preorder-traversal/description/
 *
 * algorithms
 * Medium (71.93%)
 * Likes:    81
 * Dislikes: 0
 * Total Accepted:    7.2K
 * Total Submissions: 10K
 * Testcase Example:  '[8,5,1,7,10,12]'
 *
 * 返回与给定先序遍历 preorder 相匹配的二叉搜索树（binary search tree）的根结点。
 * 
 * (回想一下，二叉搜索树是二叉树的一种，其每个节点都满足以下规则，对于 node.left 的任何后代，值总 < node.val，而
 * node.right 的任何后代，值总 > node.val。此外，先序遍历首先显示节点的值，然后遍历 node.left，接着遍历
 * node.right。）
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：[8,5,1,7,10,12]
 * 输出：[8,5,10,1,7,null,12]
 * 
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= preorder.length <= 100
 * 先序 preorder 中的值是不同的。
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
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else {
            return nil
        }
        var inorder  = preorder, map = [Int: Int]()//中序遍历是递增的数据集合
        quickSort(&inorder)//这就相当于给了前序遍历和中序遍历
        for (i, v) in inorder.enumerated() {
            map[v] = i 
        }//转换成val - idx 下标
        //preorder start sp
        //preorder end ep
        //inorder start si
        //inorder end ei
        func dfs(_ sp: Int, _ ep: Int, _ si: Int, _ ei: Int) -> TreeNode? {
            if sp > ep {
                return nil
            }
            let rootv = preorder[sp]//preorder 中取 sp 为 root
            let indexRootV = map[rootv] ?? 0 //通过 root 获取到在inorder 中的下标
            let count = indexRootV - si //获取到的下标距离 inorder的开始位置的距离
            let root = TreeNode(rootv)
            //左节点： 起始位置 preorder: sp + 1， 结束 sp + 距离， inorder 起始点不变，结束点 root的下标 - 1
            //左节点： 起始位置sp + 1 + 距离， 结束位置不变， inorder 起始点是 root下标 + 1，结束位置不变 ei
            root.left = dfs(sp + 1, sp + count, si, indexRootV - 1)
            root.right = dfs(sp + count + 1, ep, indexRootV + 1, ei)
            return root
        }
        return dfs(0, preorder.count - 1, 0, inorder.count - 1)
    }

    private func quickSort(_ inorder: inout [Int]) {
        func quickSort_inner(_ left: Int, _ right: Int) {
            if left >= right {
                return
            }
            func partation() -> Int {
                var p = Int.random(in: left ... right)
                let pv = inorder[p]
                inorder.swapAt(right, p)
                p = left
                for j in left ..< right {
                    if inorder[j] < pv {
                        inorder.swapAt(j, p)
                        p += 1
                    }
                }
                inorder.swapAt(p, right)
                return p
            }
            let p = partation()
            quickSort_inner(left, p)
            quickSort_inner(p + 1, right)            
        }
        quickSort_inner(0, inorder.count - 1)
    }
}
// @lc code=end

