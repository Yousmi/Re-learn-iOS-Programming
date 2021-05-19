//
//  21.合并两个有序链表.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/26.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_21 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        let lf = l1, lr = l2
        var res: ListNode? = nil, next: ListNode? = nil
        if lf !== nil && lr !== nil {
            res = lf!.val <= lr!.val ? lf : lr
            next = lf!.val <= l2!.val ? lr : lf
        }
        
        let s = mergeTwoLists(res, next)
        res?.next = s
        return res
    }
}






















//MARK: - 第二遍 迭代调用
class Solution_21_1 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var cur:ListNode? = dummy
        var lf = l1, lr = l2
        while lf != nil && lr != nil {
            if lf!.val <= lr!.val {
                cur?.next = lf
                lf = lf!.next
            } else {
                cur?.next = lr
                lr = lr!.next
            }
            cur = cur?.next
        }
        cur?.next = (lf == nil) ? lr : lf
        return dummy.next
    }
}























//MARK: - 第三遍 递归调用
class Solution_21_2 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val <= l2!.val {
            l1!.next = mergeTwoLists(l1!.next, l2)
            return l1
        } else {
            l2!.next = mergeTwoLists(l2!.next, l1)
            return l2
        }
    }
}
