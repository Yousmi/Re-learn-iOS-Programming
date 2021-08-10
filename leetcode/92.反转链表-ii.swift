/*
 * @lc app=leetcode.cn id=92 lang=swift
 *
 * [92] 反转链表 II
 *
 * https://leetcode-cn.com/problems/reverse-linked-list-ii/description/
 *
 * algorithms
 * Medium (49.97%)
 * Likes:    364
 * Dislikes: 0
 * Total Accepted:    49.5K
 * Total Submissions: 99K
 * Testcase Example:  '[1,2,3,4,5]\n2\n4'
 *
 * 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 * 
 * 说明:
 * 1 ≤ m ≤ n ≤ 链表长度。
 * 
 * 示例:
 * 
 * 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 * 输出: 1->4->3->2->5->NULL
 * 
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
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
        强行遍历 借助stack
        guard m <= n || head != nil else {
            return nil
        }
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
    }
}
// @lc code=end

