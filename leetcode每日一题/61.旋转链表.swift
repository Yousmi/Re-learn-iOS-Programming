//
//  61.旋转链表.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_61 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil && k > 0 else {
            return head
        }
        var lenght = 1, cur = head, k = k, tail = head
        while cur?.next != nil {
            lenght += 1
            cur = cur?.next
        }
        tail = cur
        k = k % lenght
        var prev = tail
        tail?.next = head
        cur = head
        for _ in 0 ..< (lenght - k)  {
            cur = cur?.next
            prev = prev?.next
        }
        prev?.next = nil
        return cur
    }
}
