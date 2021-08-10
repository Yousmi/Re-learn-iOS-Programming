/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
 *
 * https://leetcode-cn.com/problems/merge-two-sorted-lists/description/
 *
 * algorithms
 * Easy (62.39%)
 * Likes:    1043
 * Dislikes: 0
 * Total Accepted:    266.5K
 * Total Submissions: 427.1K
 * Testcase Example:  '[1,2,4]\n[1,3,4]'
 *
 * 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 
 * 
 * 示例：
 * 
 * 输入：1->2->4, 1->3->4
 * 输出：1->1->2->3->4->4
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
class Solution {
    //递归思路
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if l1!.val <= l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l2?.next, l1)
            return l2
        }
    }
    /*
    第一遍迭代思路
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result = ListNode(0)

        var prev:ListNode? = result
        var l1Cur = l1
        var l2Cur = l2

        while l1Cur != nil && l2Cur != nil {
            if l1Cur!.val <= l2Cur!.val {
                prev?.next = l1Cur
                l1Cur = l1Cur!.next
            }else {
                prev?.next = l2Cur
                l2Cur = l2Cur!.next
            }
            prev = prev?.next
        }
        prev?.next = (l1Cur == nil) ? l2Cur : l1Cur
    
        return result.next
    }
    */
}
// @lc code=end

