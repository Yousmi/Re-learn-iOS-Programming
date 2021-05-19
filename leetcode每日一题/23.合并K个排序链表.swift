//
//  23.合并K个排序链表.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/27.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_23 {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else {
            return nil
        }
        return _mergeKLists(lists, 0, lists.count - 1)
    }

    private func _mergeKLists(_ lists: [ListNode?],_ left:Int, _ right: Int) -> ListNode? {
        if left == right  {
            return lists[left]
        }
        let mid = left + (right - left) >> 1
        let  l1 = _mergeKLists(lists, left, mid)
        let  l2 = _mergeKLists(lists, mid + 1, right)
        return _mergeTowList(l1, l2)
    }

    private func _mergeTowList(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        if l1!.val <= l2!.val {
            l1?.next = _mergeTowList(l1?.next, l2)
            return l1
        } else {
            l2?.next = _mergeTowList(l1, l2?.next)
            return l2
        }
    }
    
    // 1、单个的合并 0-1 -> res , 在合并 res-2 -> res,  ...  这样下去 时间超时
    // 2、下面这个手动维护一个两两合并，然后递归合并
    func mergeKLists_1(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else {
            return lists.first ?? nil
        }

        var lists = lists, lastOne: ListNode? = nil
        if lists.count % 2 == 1 {
            lastOne = lists.removeLast()
        }
        var itemRes = [ListNode?](), i = 0
        while i < lists.count {
            while i % 2 == 0 && i < lists.count{
                i += 1
            }
            let item = merge(lists[i], lists[i - 1])
            itemRes.append(item)
            i += 1
        }
        if lastOne != nil {
            itemRes.append(lastOne)
        }
        
        return mergeKLists(itemRes)
    }
    
    private func merge(_ node1: ListNode?, _ node2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var cur: ListNode? = dummy
        var m_node1: ListNode? = node1, m_node2: ListNode? = node2
        while m_node1 != nil && m_node2 != nil {
            if m_node1!.val <= m_node2!.val {
                cur?.next = m_node1
                m_node1 = m_node1?.next
            } else {
                cur?.next = m_node2
                m_node2 = m_node2?.next
            }
            cur = cur?.next
        }
        cur?.next = m_node1 == nil ? m_node2 : m_node1
        return dummy.next
    }
}
