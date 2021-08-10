class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head   
        
        var length = 0
        var cur = head
        while cur != nil {
            length += 1
            cur = cur?.next
        }

        let target = length - n 
        var left = 0
        cur = dummy
        while (target - left > 0) {
            left = left + 1
            cur = cur?.next
        }

        cur?.next = cur?.next?.next
        return dummy.next

        // // 快慢指针:
        // let result = ListNode(0)
        // result.next = head;

        // var fastNode: ListNode? = result
        // var slowNode: ListNode? = result

        // for i in 0...n {
        //     fastNode = fastNode?.next
        // }

        // while (fastNode != nil) {
        //     fastNode = fastNode?.next
        //     slowNode = slowNode?.next
        // }

        // slowNode?.next = slowNode?.next?.next
        // return result.next
    }
}