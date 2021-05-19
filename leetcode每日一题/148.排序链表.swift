//
//  148.排序链表.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/6/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_148 {
    func merge_sort(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var cur: ListNode? = nil, slow = head, fast = head
        while fast != nil && fast?.next != nil {
            cur = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        cur?.next = nil
    
        let left: ListNode? = merge_sort(head)
        let right: ListNode? = merge_sort(slow)
    
        return merge(left, right)
    }
    
    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var cur: ListNode? = dummy

        var left = l1, right = l2
        while left != nil && right != nil {
            if left!.val <= right!.val {
                cur?.next = left
                left = left?.next
            } else {
                cur?.next = right
                right = right?.next
            }
            cur = cur?.next
        }
        
        cur?.next = (left == nil) ? right : left
        
        return dummy.next
    }
    
}
