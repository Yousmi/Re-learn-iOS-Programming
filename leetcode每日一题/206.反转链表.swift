//
//  206.反转链表.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/24.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_206 {
    func reverse(_ node: ListNode?) -> ListNode? {
        if node == nil || node?.next == nil {
            return node
        }
        let res = reverse(node?.next)
        node?.next?.next = node
        node?.next = nil
        return res
    }
    
    func reverse_1(_ node: ListNode?) -> ListNode? {
        if node == nil {
            return node
        }
        var prev: ListNode? = nil, cur = node
        while cur != nil {
            let temp = cur?.next
            
            cur?.next = prev
            prev = cur
            cur = temp
        }
        
        return prev
    }
}
