//
//  203.移除链表元素.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_203 {
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
