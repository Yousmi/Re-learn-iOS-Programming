//
//  25.K 个一组翻转链表.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/8.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
//
//k 是一个正整数，它的值小于或等于链表的长度。
//
//如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
import Foundation

class Solution_25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        func reverse(_ node: ListNode?) -> ListNode? {
            var pre: ListNode? = nil, cur: ListNode? = node
            while cur != nil {
                let temp = cur?.next
                cur?.next = pre
                pre = cur
                cur = temp
            }
            return pre
        }

        let dummy = ListNode(0)
        dummy.next = head
        var pre: ListNode? = dummy, cur: ListNode? = dummy
        while cur?.next != nil {
            var i = 0
            while cur != nil && i < k {
                cur = cur?.next
                i += 1
            }
            if cur == nil {
                break
            }
            let start = pre?.next
            let kStart = cur?.next
            cur?.next = nil
            pre?.next = reverse(start)
            start?.next = kStart
            pre = start
            cur = start
        }
        return dummy.next
    }

    func reverseKGroup_3(_ head: ListNode?, _ k: Int) -> ListNode? {
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
    
    
    func reverseKGroup_1(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre: ListNode? = dummy, end: ListNode? = dummy
        
        while end?.next != nil {
            var i = 0
            while end != nil && i < k {
                end = end?.next
                i += 1
            }
            if end == nil {
                break
            }
            let start = pre?.next
            let next = end?.next
            end?.next = nil
            pre?.next = _reverse(start)
            start?.next = next
            pre = start
            end = start
        }
        
        return dummy.next
    }

    private func _reverse(_ head: ListNode?) -> ListNode? {
        
        var cur = head, pre: ListNode? = nil
        while cur != nil {
            let temp = cur?.next
            
            cur?.next = pre
            pre?.next = temp
            pre = cur
            cur = temp
        }
        return pre
    }
    
    
    func reverseKGroup_2(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || k == 1 {
            return head
        }
        var kNode: ListNode? = head, i = k
        
        while i > 0 {
            kNode = kNode?.next
            i -= 1
            if kNode == nil {
                break
            }
        }
        if i > 0 {
            return head
        }
        
        var cur = head?.next, pre: ListNode? = head
        pre?.next = reverseKGroup_2(kNode, k)
        
        var next = cur?.next
        i = k - 1
        while i > 0 {
            cur?.next = pre
            pre = cur
            i -= 1
            if i > 0 {
                cur = next
                next = next?.next
            }
        }
        
        return cur
    }
}
