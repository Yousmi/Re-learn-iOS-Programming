/*
 * @lc app=leetcode.cn id=24 lang=swift
 *
 * [24] 两两交换链表中的节点
 *
 * https://leetcode-cn.com/problems/swap-nodes-in-pairs/description/
 *
 * algorithms
 * Medium (65.75%)
 * Likes:    524
 * Dislikes: 0
 * Total Accepted:    114.5K
 * Total Submissions: 173.8K
 * Testcase Example:  '[1,2,3,4]'
 *
 * 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 * 
 * 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 * 
 * 
 * 
 * 示例:
 * 
 * 给定 1->2->3->4, 你应该返回 2->1->4->3.
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
    func swapPairs(_ head: ListNode?) -> ListNode? {

        /*
        递归解法
        */
        if head == nil || head?.next == nil {
            return head
        }

        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next

        /*
        顺便把链表反转的代码写下
        let res = reversed(head?.next)
        head.next.next = head
        head.next = nil
        return res

        var prev: ListNode?
        var cur = head
        
        while cur != nil {
            let temp = cur!.next

            cur!.next = prev
            prev = cur
            cur = temp
        }
        return prev
        */

        /*
        let dummy: ListNode = ListNode(0)
        dummy.next = head
        var cur: ListNode? = dummy
        while cur?.next != nil && cur?.next?.next != nil {
            let cur_next = cur?.next //第一个
            let cur_next_next = cur_next?.next //第二个
            let temp = cur_next_next?.next ////第二个
            
            cur_next_next?.next = cur_next
            cur_next?.next = temp
            cur?.next = cur_next_next
            cur = cur_next
        }
        return dummy.next
        */
    //    好理解的方式二
    //    //1、交互2个节点 2、分别移动节点
    //    var pre: ListNode? = dummy
    //    var cur = head
    //    var next = cur?.next

    //    while cur != nil && next != nil {
    //        let temp = next?.next

    //        cur?.next = temp
    //        next?.next = cur
    //        pre?.next = next

    //        pre = cur
    //        cur = temp
    //        next = cur?.next
    //    }
    //    return dummy.next
    }
}
// @lc code=end

