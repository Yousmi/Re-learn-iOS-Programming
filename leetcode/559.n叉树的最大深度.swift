/*
 * @lc app=leetcode.cn id=559 lang=swift
 *
 * [559] N叉树的最大深度
 *
 * https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree/description/
 *
 * algorithms
 * Easy (69.44%)
 * Likes:    98
 * Dislikes: 0
 * Total Accepted:    27.2K
 * Total Submissions: 38.8K
 * Testcase Example:  '[1,null,3,2,4,null,5,6]'
 *
 * 给定一个 N 叉树，找到其最大深度。
 * 
 * 最大深度是指从根节点到最远叶子节点的最长路径上的节点总数。
 * 
 * 例如，给定一个 3叉树 :
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 我们应返回其最大深度，3。
 * 
 * 说明:
 * 
 * 
 * 树的深度不会超过 1000。
 * 树的节点总不会超过 5000。
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
    func maxDepth(_ root: Node?) -> Int {
        return bfs(root)
    }
    
    //dfs
    private func dfs(_ root: Node?) -> Int {
        if root == nil {
            return 0
        }
        var level = 0
        for i in root!.children {
            level = max(level, dfs(i))
        }
        
        return level + 1
    }

    //bfs
    private func bfs(_ root: Node?) -> Int {
        guard root != nil else {
            return 0
        }
        var queue:[Node] = [root!], res = 0
        while !queue.isEmpty {
            for i in 0 ..< queue.count {
                let first = queue.removeFirst()
                queue.append(contentsOf: first.children)
            }
            res += 1
        }

        return res
    }
}
// @lc code=end

