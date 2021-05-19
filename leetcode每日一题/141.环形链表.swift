//
//  141.环形链表.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/8.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head

        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast && fast != nil {
                return true
            }
        }
        return false
    }
}
