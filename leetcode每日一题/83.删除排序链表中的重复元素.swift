//
//  83.删除排序链表中的重复元素.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_83 {
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
