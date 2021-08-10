/*
 * @lc app=leetcode.cn id=109 lang=swift
 *
 * [109] 有序链表转换二叉搜索树
 *
 * https://leetcode-cn.com/problems/convert-sorted-list-to-binary-search-tree/description/
 *
 * algorithms
 * Medium (72.32%)
 * Likes:    255
 * Dislikes: 0
 * Total Accepted:    33.8K
 * Total Submissions: 46.3K
 * Testcase Example:  '[-10,-3,0,5,9]'
 *
 * 给定一个单链表，其中的元素按升序排序，将其转换为高度平衡的二叉搜索树。
 * 
 * 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 * 
 * 示例:
 * 
 * 给定的有序链表： [-10, -3, 0, 5, 9],
 * 
 * 一个可能的答案是：[0, -3, 9, -10, null, 5], 它可以表示下面这个高度平衡二叉搜索树：
 * 
 * ⁠     0
 * ⁠    / \
 * ⁠  -3   9
 * ⁠  /   /
 * ⁠-10  5
 * 
 * 
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
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
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        var res = [Int](), cur = head 
        while cur != nil {
            res.append(cur!.val)
            cur = cur?.next
        }
        return buildTree(res, 0, res.count - 1)
    }
    private func buildTree(_ arr:[Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = left + (right - left) >> 1
        let root = TreeNode(arr[mid])
        root.left = buildTree(arr, left, mid - 1)
        root.right = buildTree(arr, mid + 1, right)
        return root
    }

    func sortedListToBST_1(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        return buildNode(head, nil)
    }
    private func midItem(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
        var slow: ListNode? = head, fast: ListNode? = head
        while (fast !== tail && fast?.next !== tail) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    private func buildNode(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
        if head === tail {
            return nil
        }
        let node = midItem(head, tail)
        let root = TreeNode(node!.val)
        root.left = buildNode(head, node)
        root.right = buildNode(node?.next, tail)
        return root
    }
}
// @lc code=end

