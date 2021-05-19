//
//  641.设计循环双端队列.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/6/29.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

/*
 * @lc app=leetcode.cn id=641 lang=swift
 *
 * [641] 设计循环双端队列
 */

// @lc code=start
//["MyCircularDeque","insertLast","insertLast","insertFront","insertFront","getRear","isFull","deleteLast","insertFront","getFront"]
//[[3], [1], [2], [3], [4],  [],[],   [],  [4], []]
//[null,true,true,true,true, 2, false,true,true, 4] output
//[null,true,true,true,false,2, true, true,true, 4] answer

class MyCircularDeque {
    
    var array:[Int] = []
    var size: Int = 0
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        self.size = k
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        self.array.insert(value, at: 0)
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        self.array.append(value)
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        self.array.remove(at: 0)
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        _ = self.array.popLast()
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        return self.array.first ?? -1
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        return self.array.last ?? -1
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return self.array.isEmpty
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return self.array.count == self.size
    }
  
    /* 链表实现
    class ListNode : NSObject{
        
        var val: Int = 0
        var next: ListNode?
        
        init(_ v: Int) {
            self.val = v
        }
        
    }
    
    var cost: Int = 0
    var maxSize: Int = 0
    var head: ListNode?
    var tail: ListNode?
    
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        self.maxSize = k
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        let node = ListNode(value)
        node.next = head
        head = node
        tail = (tail == nil) ? node : tail
        cost += 1
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        let node = ListNode(value)
        tail?.next = node
        tail = node
        head = (head == nil) ? node : head
        cost += 1
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        let temp = head?.next;
        head?.next = nil
        head = temp
        tail = (temp == nil) ? nil : tail
        cost -= 1
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        var temp: ListNode? = head
        if head != tail && head != nil {
            while temp?.next != tail {
                temp = temp?.next
            }
            temp?.next = nil
            tail = temp
        } else {
            head = nil; tail = nil
        }
        cost -= 1
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        return (head != nil) ? head!.val :  -1
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        return (tail != nil) ? tail!.val :  -1
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return  head == tail && head == nil
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return self.cost == self.maxSize
    }
    */
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
// @lc code=end


