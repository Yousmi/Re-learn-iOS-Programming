/*
 * @lc app=leetcode.cn id=203 lang=swift
 *
 * [203] 移除链表元素
 *
 * https://leetcode-cn.com/problems/remove-linked-list-elements/description/
 *
 * algorithms
 * Easy (45.56%)
 * Likes:    415
 * Dislikes: 0
 * Total Accepted:    91.8K
 * Total Submissions: 199.9K
 * Testcase Example:  '[1,2,6,3,4,5,6]\n6'
 *
 * 删除链表中等于给定值 val 的所有节点。
 * 
 * 示例:
 * 
 * 输入: 1->2->6->3->4->5->6, val = 6
 * 输出: 1->2->3->4->5
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var pre: ListNode? = dummy, cur = head
        while cur != nil {
            if cur!.val == val {
                pre?.next = cur?.next
                cur = pre?.next
            } else {
                cur = cur?.next
                pre = pre?.next
            }
        }
        return dummy.next
    }
}
// @lc code=end

