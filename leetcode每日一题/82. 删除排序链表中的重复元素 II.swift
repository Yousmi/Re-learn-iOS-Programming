//
//  83.删除排序链表中的重复元素.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

/**

存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除链表中所有存在数字重复情况的节点，只保留原始链表中 没有重复出现 的数字。

返回同样按升序排列的结果链表。

 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution_82 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var dummy = ListNode(-1)
        dummy.next = head
        var cur: ListNode? = head
        var pre: ListNode? = dummy
        var del: ListNode? = nil
        while cur != nil {
            let next = cur!.next
            let nnext = next?.next
            if let ne = next, ne.val == cur!.val {
                del = cur
                pre?.next = nnext
                cur = nnext
                continue
            }
            if del != nil && del!.val == cur!.val {
                del = nil
                pre?.next = cur?.next
                cur = cur?.next
                continue
            }
            pre = pre?.next
            cur = cur?.next
        }
        return dummy.next
    }
}