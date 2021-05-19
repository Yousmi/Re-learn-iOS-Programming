//
//  24.两两交换链表中的节点.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/22.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode = ListNode(0)
        dummy.next = head
        
        //1、交互2个节点 2、分别移动节点
        var pre: ListNode? = dummy
        var cur = head
        var next = cur?.next

        while cur != nil && next != nil {
            let temp = next?.next

            cur?.next = temp
            next?.next = cur
            pre?.next = next

            pre = cur
            cur = temp
            next = cur?.next
        }
        
        return dummy.next
    }
}
