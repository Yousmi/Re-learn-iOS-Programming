//
//  92.反转链表 II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/26.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

// 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
class Solution_92 {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if m == 1 {
            return _reverseBetween(head, n)
        }
        head?.next = self.reverseBetween(head?.next, m - 1, n - 1)
        return head
    }
    
    private func _reverseBetween(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            return head
        }
        let res = _reverseBetween(head?.next, n - 1)
        let temp = head?.next?.next
        head?.next?.next = head
        head?.next = temp
        return res
    }
    
    func reverseBetween_2(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard head != nil && n >= m else {
            return head
        }
        let dummy = ListNode(0)
        dummy.next = head
        var pre: ListNode? = dummy
        for _ in 0 ..< m - 1 {
            pre = pre?.next
        }
        var cur = pre?.next
        let start = pre?.next
        pre?.next = reves(start, n - m, 0, &cur)
        start?.next = cur
        return dummy.next
    }

    private func reves(_ root: ListNode?, _ target: Int, _ level: Int, _ last: inout ListNode?) -> ListNode? {
        if level >= target {
            last = root?.next
            return root
        }
        let res = reves(root?.next, target, level + 1, &last)
        root?.next?.next = root
        return res
    }
    
    func reverseBetween_1(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard m <= n || head != nil else {
            return nil
        }
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var prev = dummy
        for _ in 0 ..< m - 1 {
            prev = prev?.next
        }
        let cur = prev?.next
        for _ in m ..< n { //重点逻辑是： 找到前面的一个节点。之后的 m到n之际两两反转
            let next = cur?.next
            cur?.next = next?.next
            
            next?.next = prev?.next
            prev?.next = next
        }
        return dummy?.next
        /*
        let dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var i = 1
        var node = head
        var prev = dummy
        while i < m && node != nil {
            prev = prev?.next
            node = node?.next
            i += 1
        }
        
        var stack = [ListNode]()
        while i <= n && node != nil {
            stack.append(node!)
            node = node!.next
            i += 1
        }
        while stack.count != 0 {
            let pop = stack.popLast()
            prev?.next = pop
            prev = pop
        }
        prev?.next = node

        return dummy?.next
        */
 
//        var stack = [ListNode]()
//        let dummy: ListNode? = ListNode(0)
//        dummy?.next = head
//        var i = 1
//        var i_node = dummy
//        var pre = dummy
//        while i < m && i_node != nil {
//            pre = pre?.next
//            i_node = i_node?.next
//            i += 1
//        }
//
//        while i <= n && i_node != nil {
//            i_node = i_node?.next
//            stack.append(i_node!)
//            i += 1
//        }
//        let leftHead = i_node?.next
//        while stack.count != 0 {
//
//            let pop = stack.popLast()
//            pre?.next = pop
//            pre = pop
//        }
//
//        pre?.next = leftHead
//
//
//        return dummy?.next
    }
}
