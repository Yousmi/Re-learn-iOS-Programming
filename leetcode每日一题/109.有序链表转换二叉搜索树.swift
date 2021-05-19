//
//  109.有序链表转换二叉搜索树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/18.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_109 {
    //遍历一遍 n 空间 n
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        var cur = head, res = [Int]()
        while cur != nil {
            res.append(cur!.val)
            cur = cur?.next
        }
        return buildTree(res, 0, res.count - 1)
    }
    //归并 nlogn
    private func buildTree(_ arr:[Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = left + (right - left) >> 1
        let root = TreeNode(arr[mid])
        root.left = buildTree(arr, left, mid - 1)
        root.right = buildTree(arr, mid + 1, right)
        return root
    }
    
    func sortedListToBST_1(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        return buildNode(head, nil)
    }
    private func midItem(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
        var slow: ListNode? = head, fast: ListNode? = head
        while (fast !== tail && fast?.next !== tail) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    private func buildNode(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
        if head === tail {
            return nil
        }
        let node = midItem(head, tail)
        let root = TreeNode(node!.val)
        root.left = buildNode(head, node)
        root.right = buildNode(node?.next, tail)
        return root
    }
}
