/*
 * @lc app=leetcode.cn id=83 lang=swift
 *
 * [83] 删除排序链表中的重复元素
 *
 * https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/description/
 *
 * algorithms
 * Easy (50.42%)
 * Likes:    352
 * Dislikes: 0
 * Total Accepted:    121.4K
 * Total Submissions: 238.2K
 * Testcase Example:  '[1,1,2]'
 *
 * 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 * 
 * 示例 1:
 * 
 * 输入: 1->1->2
 * 输出: 1->2
 * 
 * 
 * 示例 2:
 * 
 * 输入: 1->1->2->3->3
 * 输出: 1->2->3
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        head?.next = deleteDuplicates(head?.next)
        if head?.val == head?.next?.val {
            head?.next = head?.next?.next
        }
        return head
    }

    func deleteDuplicates_1(_ head: ListNode?) -> ListNode? {
        var cur = head 
        while cur != nil && cur?.next != nil {
            if cur?.val == cur?.next?.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return head
    }
}
// @lc code=end

