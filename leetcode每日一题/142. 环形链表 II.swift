//
//  142. 环形链表 II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/8.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
//
//为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
//
//说明：不允许修改给定的链表。
import Foundation

class Solution_142 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return nil
        }
        var slow = head, fast = head, next = head
        
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                while next !== slow {
                    slow = slow?.next
                    next = next?.next
                }
                return next
            }
        }
        return nil
    }
}
