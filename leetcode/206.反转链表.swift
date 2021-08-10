/*
 * @lc app=leetcode.cn id=206 lang=swift
 *
 * [206] 反转链表
 *
 * https://leetcode-cn.com/problems/reverse-linked-list/description/
 *
 * algorithms
 * Easy (68.91%)
 * Likes:    951
 * Dislikes: 0
 * Total Accepted:    234.4K
 * Total Submissions: 340.2K
 * Testcase Example:  '[1,2,3,4,5]'
 *
 * 反转一个单链表。
 * 
 * 示例:
 * 
 * 输入: 1->2->3->4->5->NULL
 * 输出: 5->4->3->2->1->NULL
 * 
 * 进阶:
 * 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
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
class Solution {
    func reverseList(_ inputNode: ListNode?) -> ListNode? {
        var prev: ListNode?
        var cur = inputNode
        
        while cur != nil {
            let next = cur?.next
            
            cur?.next = prev
            prev = cur
            cur = next
        }
        
        return prev

        // if head?.next == nil {
        //     return head
        // }
        // let result = reverseList(head?.next)
        // head?.next?.next = head
        // head?.next = nil
        // return result
    }
}
// @lc code=end

