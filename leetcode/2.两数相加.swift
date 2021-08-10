/*
 * @lc app=leetcode.cn id=2 lang=swift
 *
 * [2] 两数相加
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil, l2 != nil else {
            return l1 == nil ? l2 : l1
        }
        var carray = 0, cursor: ListNode?, l1 = l1, l2 = l2
        let dummy = ListNode(0)
        cursor = dummy
        while l1 != nil || l2 != nil || carray > 0 {
            var sum = carray
            if let l1 = l1 {
                sum += l1.val
            }
            if let l2 = l2 {
                sum += l2.val
            }
            let node = ListNode(sum % 10)
            carray = sum / 10
            cursor?.next = node
            cursor = node
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return dummy.next
    }

    func addTwoNumbers_3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func add(_ l1: ListNode?, _ l2: ListNode?, _ carray: Int) -> ListNode? {
            if l1 == nil && l2 == nil && carray > 0 {
                return ListNode(carray)
            } else {
                if carray == 0 && (l1 == nil || l2 == nil) {
                    return (l1 == nil) ? l2 : l1
                }
            }
            let sum = (l1 == nil ? 0 : l1!.val) + (l2 == nil ? 0 : l2!.val) + carray
            let res = ListNode(sum % 10)
            res.next = add(l1?.next, l2?.next, sum / 10)
            return res
        }
        return add(l1, l2, 0)
    }

    func addTwoNumbers_2(_ firstOne: ListNode?, _ second: ListNode?) -> ListNode? {
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

    func addTwoNumbers_1(_ firstOne: ListNode?, _ second: ListNode?) -> ListNode? {
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
}
// @lc code=end

