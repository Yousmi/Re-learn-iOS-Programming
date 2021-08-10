/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
 *
 * https://leetcode-cn.com/problems/reverse-nodes-in-k-group/description/
 *
 * algorithms
 * Hard (58.62%)
 * Likes:    519
 * Dislikes: 0
 * Total Accepted:    61.2K
 * Total Submissions: 102.4K
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 * 
 * k 是一个正整数，它的值小于或等于链表的长度。
 * 
 * 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 * 
 * 
 * 
 * 示例：
 * 
 * 给你这个链表：1->2->3->4->5
 * 
 * 当 k = 2 时，应当返回: 2->1->4->3->5
 * 
 * 当 k = 3 时，应当返回: 3->2->1->4->5
 * 
 * 
 * 
 * 说明：
 * 
 * 
 * 你的算法只能使用常数的额外空间。
 * 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil ||  k <= 1 {
            return head
        }
        var res: ListNode? = nil, lenght = 0
        var lastHead: ListNode? = head, cur = head, lastTail: ListNode? = nil
        while cur != nil {
            lenght += 1
            cur = cur?.next
        }
        if k > lenght {
            return head
        }
        
        cur = head
        let count = lenght / k
        for _ in 0 ..< count {
            for j in 0 ..< k - 1 {
                cur = cur?.next
                if j == k - 2 {
                    let temp = cur?.next
                    cur?.next = nil
                    cur = temp
                }
            }
            let n = reverse(lastHead)
            if res == nil {
                res = n
            }
            lastTail?.next = n
            lastTail = lastHead
            lastHead?.next = cur
            lastHead = cur
        }
        return res
    }
    
    private func reverse(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let res = reverse(head?.next)
        head?.next?.next = head
        head?.next = nil
        return res
    }
}
// @lc code=end

