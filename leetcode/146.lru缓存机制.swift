/*
 * @lc app=leetcode.cn id=146 lang=swift
 *
 * [146] LRU缓存机制
 *
 * https://leetcode-cn.com/problems/lru-cache/description/
 *
 * algorithms
 * Medium (49.36%)
 * Likes:    818
 * Dislikes: 0
 * Total Accepted:    90.5K
 * Total Submissions: 179.5K
 * Testcase Example:  '["LRUCache","put","put","get","put","get","put","get","get","get"]\n' +
  '[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]'
 *
 * 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
 * 
 * 获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
 * 写入数据 put(key, value) -
 * 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
 * 
 * 
 * 
 * 进阶:
 * 
 * 你是否可以在 O(1) 时间复杂度内完成这两种操作？
 * 
 * 
 * 
 * 示例:
 * 
 * LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
 * 
 * cache.put(1, 1);
 * cache.put(2, 2);
 * cache.get(1);       // 返回  1
 * cache.put(3, 3);    // 该操作会使得关键字 2 作废
 * cache.get(2);       // 返回 -1 (未找到)
 * cache.put(4, 4);    // 该操作会使得关键字 1 作废
 * cache.get(1);       // 返回 -1 (未找到)
 * cache.get(3);       // 返回  3
 * cache.get(4);       // 返回  4
 * 
 * 
 */

// @lc code=start

class LRUCache {
    class DoubleLinked {
        var key: Int
        var val: Int
        var prev: DoubleLinked?
        var next: DoubleLinked?
        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }
    
    let capacity: Int
    private var usage: Int = 0
    private var map = [Int: DoubleLinked]()
    private var head: DoubleLinked?
    private var tail: DoubleLinked?
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else {
            return -1
        }
        update(node)
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let exist = map[key] {
            exist.val = value
            update(exist)
            return
        }
        if self.usage < capacity {
            let node = DoubleLinked(key, value)
            map[key] = node
            if let head = self.head {
                head.next = node
                node.prev = head
                self.head = node
            } else {
                self.head = node
            }
            if self.tail == nil {
                self.tail = node
            }
            self.usage += 1
        } else if let tail = self.tail {
            map[tail.key] = nil
            tail.key = key
            tail.val = value
            map[key] = tail
            update(tail)
        }
    }
    
    private func update(_ node: DoubleLinked) {
        if let next = node.next {
            node.next = nil
            next.prev = nil
            
            if let prev = node.prev {
                node.prev = nil
                prev.next = next
                next.prev = prev
            } else if self.tail === node {
                self.tail = next
            }
            
            if let head = self.head {
                node.prev = head
                head.next = node
            }
            
            head = node
        }
    }
}


/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

