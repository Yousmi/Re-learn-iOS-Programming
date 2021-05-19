//
//  234. 回文链表.swift
//  INTERVIEW
//
//  Created by Scan on 2020/10/27.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_234 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else {
            return false
        }
        var cur = head, count = 1
        while cur?.next != nil {
            count += 1
            cur = cur?.next
        }
        cur?.next = head
        var slowNode = head
        var sStep = 0
        var fStep = 0
        while sStep < (count / 2) {
            var fase = count - fStep, fastNode = cur
            while fase != 0 {
                fase -= 1
                fastNode = fastNode?.next
            }
            if slowNode!.val != fastNode!.val {
                return false
            }
            slowNode = slowNode?.next
            fStep += 1
            sStep += 1
        }
        return true
    }
}
