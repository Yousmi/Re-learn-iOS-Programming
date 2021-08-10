/*
 * @lc app=leetcode.cn id=148 lang=swift
 *
 * [148] 排序链表
 *
 * https://leetcode-cn.com/problems/sort-list/description/
 *
 * algorithms
 * Medium (65.33%)
 * Likes:    538
 * Dislikes: 0
 * Total Accepted:    60.4K
 * Total Submissions: 92.4K
 * Testcase Example:  '[4,2,1,3]'
 *
 * 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 * 
 * 示例 1:
 * 
 * 输入: 4->2->1->3
 * 输出: 1->2->3->4
 * 
 * 
 * 示例 2:
 * 
 * 输入: -1->5->3->4->0
 * 输出: -1->0->3->4->5
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
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var pre:ListNode? = nil
        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {
            pre = slow
            slow = slow?.next
            fast = fast?.next?.next
        }

        pre?.next = nil

        let left = sortList(head)
        let right = sortList(slow)
    
        return mergeTowList(left, right)
    }

    private func mergeTowList(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var result: ListNode = ListNode(0)

        var prev:ListNode? = result
        var l1 = left, l2 = right
        while (l1 != nil && l2 != nil) {
            if l1!.val <= l2!.val {
                prev?.next = l1
                l1 = l1!.next
            }
            else {
                prev?.next = l2
                l2 = l2!.next
            }
            prev = prev?.next
        }
        prev?.next = (l1 == nil) ? l2 : l1;

        return result.next
    }
}
// @lc code=end

