//
//  146.LRU缓存机制.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/16.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

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
