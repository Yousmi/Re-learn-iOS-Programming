//
//  2.两数相加.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/6/30.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//输出：7 -> 0 -> 8
//原因：342 + 465 = 807
import Foundation

class Solution_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        var dummy = ListNode(0), cur: ListNode?, l1 = l1, l2 = l2
        var nextVal = 0
        cur = dummy
        while l1 != nil || l2 != nil || nextVal != 0 {
            let sum = (l1 == nil ? 0 : l1!.val) + (l2 == nil ? 0 : l2!.val) + nextVal
            let sumNode = ListNode(sum % 10)
            nextVal = sum / 10
            cur?.next = sumNode
            cur = sumNode
            l1 = l1?.next
            l2 = l2?.next
        }
        return dummy.next
    }
    
    func addTwoNumbers_4(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func add(_ l1: ListNode?, _ l2: ListNode?, _ pv: Int) -> ListNode? {
            if l1 == nil && l2 == nil && pv > 0 {
                return ListNode(pv)
            } else {
                if pv == 0 && (l1 == nil || l2 == nil) {
                    return l1 == nil ? l2 : l1
                }
            }
            let sum = (l1 == nil ? 0 : l1!.val) + (l2 == nil ? 0 : l2!.val) + pv
            let res = ListNode(sum % 10)
            res.next = add(l1?.next, l2?.next, sum / 10)
            return res
        }
        return add(l1,l2,0)
    }
    
    func addTwoNumbers_3(_ firstOne: ListNode?, _ second: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var l1 = firstOne, l2 = second, carray = 0
        var cur: ListNode? = dummy
        while l1 != nil || l2 != nil {
            let sum = (l1 == nil ? 0 : l1!.val) + (l2 == nil ? 0 : l2!.val) + carray
            carray = sum / 10
            cur?.next = ListNode(sum % 10)
            cur = cur?.next
            l1 = l1?.next
            l2 = l2?.next
            if carray > 0 {
                cur?.next = ListNode(carray)
            }
        }
        return dummy.next
    }
    
    func addTwoNumbers_2(_ firstOne: ListNode?, _ second: ListNode?) -> ListNode? {
        let pre = ListNode(0)
        var l1 = firstOne
        var l2 = second
        var carray = 0
        var cur : ListNode? = pre
        while (l1 != nil || l2 != nil) {
            let x = (l1 == nil) ? 0 : l1!.val
            let y = (l2 == nil) ? 0 : l2!.val
            let sum = x + y + carray

            carray = sum / 10
            let last = sum % 10
            
            cur!.next = ListNode(last)
            cur = cur!.next

            if (l1 != nil) {
                l1 = l1!.next
            }

            if (l2 != nil) {
                l2 = l2!.next
            }

            if (carray > 0) {
                cur!.next = ListNode(carray)
            }
        }

        return pre.next
    }
    
    func addTwoNumbers_1(_ firstOne: ListNode?, _ second: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var c: ListNode? = dummy
        var f = firstOne, s = second
        var carry = 0
        
        while f != nil && s != nil {
            let v = (f!.val + s!.val + carry) % 10
            carry = (f!.val + s!.val + carry) / 10
            c?.next = ListNode(v)
            c = c?.next
            f = f!.next
            s = s!.next
        }
        var left = (f == nil) ? s : f
        while left != nil {
            let v = (left!.val + carry) % 10
            carry = (left!.val + carry) / 10
            c?.next = ListNode(v)
            c = c?.next
            left = left!.next
        }
        if carry > 0 {
            c?.next = ListNode(carry)
            c = c?.next
        }
        return dummy.next
    }
}
