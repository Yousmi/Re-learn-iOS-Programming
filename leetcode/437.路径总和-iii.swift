/*
 * @lc app=leetcode.cn id=437 lang=swift
 *
 * [437] 路径总和 III
 *
 * https://leetcode-cn.com/problems/path-sum-iii/description/
 *
 * algorithms
 * Easy (55.09%)
 * Likes:    537
 * Dislikes: 0
 * Total Accepted:    48.5K
 * Total Submissions: 87.1K
 * Testcase Example:  '[10,5,-3,3,2,null,11,3,-2,null,1]\n8'
 *
 * 给定一个二叉树，它的每个结点都存放着一个整数值。
 * 
 * 找出路径和等于给定数值的路径总数。
 * 
 * 路径不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。
 * 
 * 二叉树不超过1000个节点，且节点数值范围是 [-1000000,1000000] 的整数。
 * 
 * 示例：
 * 
 * root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
 * 
 * ⁠     10
 * ⁠    /  \
 * ⁠   5   -3
 * ⁠  / \    \
 * ⁠ 3   2   11
 * ⁠/ \   \
 * 3  -2   1
 * 
 * 返回 3。和等于 8 的路径有:
 * 
 * 1.  5 -> 3
 * 2.  5 -> 2 -> 1
 * 3.  -3 -> 11
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
    //递归 + 前缀和
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        var res = 0
        func dfs(_ root: TreeNode?, _ prefixSum: inout [Int: Int], _ pathSum: Int) {
            if root == nil {
                return
            }
            let pathSum = pathSum + root!.val
            res += prefixSum[pathSum - sum] ?? 0
            
            prefixSum[pathSum, default: 0] += 1
            
            dfs(root?.left, &prefixSum, pathSum)
            dfs(root?.right, &prefixSum, pathSum)
            
            prefixSum[pathSum, default: 0] -= 1
        }
        var prefixSum = [0: 1]
        dfs(root, &prefixSum, 0)
        return res
    }
    
    
    func pathSum_1(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        func dfs(_ root: TreeNode?, _ sum: Int) -> Int {
            if root == nil {
                return 0
            }
            var count = 0
            if root!.val == sum {
                count += 1
            }
            return count + dfs(root?.left, sum -  root!.val) + dfs(root?.right, sum -  root!.val)
        }
        return pathSum(root?.left, sum) + pathSum(root?.right, sum) + dfs(root, sum)
    }
    
    //错误的解法，，原题意思是 可以从根节点同时想左右子树扩散，
    func pathSum_xxxx(_ root: TreeNode?, _ sum: Int) -> Int {
        guard root != nil else {
            return 0
        }
        var res = 0
        func dfs(_ root: TreeNode?, _ left: Int, _ target: Int, _ count: inout Int) {
            if root == nil {
                return
            }
            if root!.val > left || root!.val == left {
                count += root!.val == left ? 1 : 0
                dfs(root?.left, target, target, &count)
                dfs(root?.right, target, target, &count)
            } else  {
                dfs(root?.left, left - root!.val, target, &count)
                dfs(root?.right, left - root!.val, target, &count)
            }
        }
        dfs(root?.left, sum, sum, &res)
        dfs(root?.right, sum, sum, &res)
        return res
    }
}
// @lc code=end

