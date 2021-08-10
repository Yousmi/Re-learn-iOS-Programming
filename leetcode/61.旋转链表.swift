/*
 * @lc app=leetcode.cn id=61 lang=swift
 *
 * [61] 旋转链表
 *
 * https://leetcode-cn.com/problems/rotate-list/description/
 *
 * algorithms
 * Medium (40.26%)
 * Likes:    252
 * Dislikes: 0
 * Total Accepted:    60.4K
 * Total Submissions: 150.2K
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
 * 
 * 示例 1:
 * 
 * 输入: 1->2->3->4->5->NULL, k = 2
 * 输出: 4->5->1->2->3->NULL
 * 解释:
 * 向右旋转 1 步: 5->1->2->3->4->NULL
 * 向右旋转 2 步: 4->5->1->2->3->NULL
 * 
 * 
 * 示例 2:
 * 
 * 输入: 0->1->2->NULL, k = 4
 * 输出: 2->0->1->NULL
 * 解释:
 * 向右旋转 1 步: 2->0->1->NULL
 * 向右旋转 2 步: 1->2->0->NULL
 * 向右旋转 3 步: 0->1->2->NULL
 * 向右旋转 4 步: 2->0->1->NULL
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
// @lc code=end

