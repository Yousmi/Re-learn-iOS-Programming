/*
 * @lc app=leetcode.cn id=199 lang=swift
 *
 * [199] 二叉树的右视图
 *
 * https://leetcode-cn.com/problems/binary-tree-right-side-view/description/
 *
 * algorithms
 * Medium (64.18%)
 * Likes:    302
 * Dislikes: 0
 * Total Accepted:    62.6K
 * Total Submissions: 97.4K
 * Testcase Example:  '[1,2,3,null,5,null,4]'
 *
 * 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。
 * 
 * 示例:
 * 
 * 输入: [1,2,3,null,5,null,4]
 * 输出: [1, 3, 4]
 * 解释:
 * 
 * ⁠  1            <---
 * ⁠/   \
 * 2     3         <---
 * ⁠\     \
 * ⁠ 5     4       <---
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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var res = [Int](), temp = [[Int]]()
        func dfs(_ root: TreeNode?, _ level: Int) {
            if root == nil {
                return
            }
            if level == temp.count {
                temp.append([Int]())
            }
            temp[level].append(root!.val)
            dfs(root?.left, level + 1)
            dfs(root?.right, level + 1)
        } 
        dfs(root, 0)
        for i in temp {
            res.append(i.last!)
        }
        return res
    }
    
    func rightSideView_2(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var queue: [TreeNode] = [root!], res = [Int]()
        while queue.count > 0 {
            res.append(queue.last!.val)
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return res
    }

    func rightSideView_1(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var queue = [TreeNode](), levelRes = [[Int]]()
        var res = [Int]()
        queue.append(root!)
        while queue.count > 0 {
            var temp = [Int]()
            for _ in 0 ..< queue.count {
                let node = queue.removeFirst()
                temp.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            levelRes.append(temp)
        }
        
        for i in levelRes {
            res.append(i.last!)
        }
        return res
    }
}
// @lc code=end

