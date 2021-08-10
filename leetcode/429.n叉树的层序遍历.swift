/*
 * @lc app=leetcode.cn id=429 lang=swift
 *
 * [429] N叉树的层序遍历
 *
 * https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/description/
 *
 * algorithms
 * Medium (65.59%)
 * Likes:    99
 * Dislikes: 0
 * Total Accepted:    25.5K
 * Total Submissions: 38.6K
 * Testcase Example:  '[1,null,3,2,4,null,5,6]'
 *
 * 给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。
 * 
 * 例如，给定一个 3叉树 :
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 返回其层序遍历:
 * 
 * [
 * ⁠    [1],
 * ⁠    [3,2,4],
 * ⁠    [5,6]
 * ]
 * 
 * 
 * 
 * 
 * 说明:
 * 
 * 
 * 树的深度不会超过 1000。
 * 树的节点总数不会超过 5000。
 * 
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
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var queue = [Node]()
        queue.append(root!)
        var res = [[Int]]()
        while queue.count > 0 {
            let count = queue.count 
            var item = [Int]()
            for i in 0 ..< count {
                let first = queue.removeFirst()
                item.append(first.val)
                queue.append(contentsOf: first.children)
            }
            res.append(item)
        }
        return res
    }

    func levelOrder_1(_ root: Node?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var res = [[Int]]()
        dfs(root, 0, &res)
        return res
    }

    private func dfs(_ root: Node?, _ level: Int, _ res: inout [[Int]]) {
        if root == nil {
            return 
        }
        if level == res.count {
            res.append([Int]())
        }
        res[level].append(root!.val)
        for i in root!.children {
            dfs(i, level + 1, &res)
        }
    }
}
// @lc code=end

