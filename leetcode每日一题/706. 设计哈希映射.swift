//
//  706. 设计哈希映射.swift
//  INTERVIEW
//
//  Created by Scan on 2021/3/14.
//  Copyright © 2021 钱志新. All rights reserved.
//

import Foundation

class MyHashMap {
    
    class Bucket {
        var b = [(Int, Int)]()
        private func getIndex(_ key: Int) -> Int {
            var index = -1
            for i in 0 ..< b.count {
                if key == b[i].0 {
                    index = i
                }
            }
            return index
        }
        
        func put(_ key: Int, _ value: Int) {
            let index = getIndex(key)
            if index >= 0 {
                b[index] = (key, value)
                return
            }
            b.append((key, value))
        }
        
        func get(_ key: Int) -> Int {
            for (key_, value_) in b {
                if key == key_ {
                    return value_
                }
            }
            return -1
        }
        
        func remove(_ key: Int) {
            let index = getIndex(key)
            if index >= 0 {
                b.remove(at: index)
            }
        }
    }
    
    let hashKey: Int = 1009
    var tables = [Bucket]()
    init() {
        for _ in 0 ..< hashKey {
            tables.append(Bucket())
        }
    }
    
    private func hash(_ key: Int) -> Int {
        return key % hashKey
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        let index = hash(key)
        tables[index].put(key, value)
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        let index = hash(key)
        return tables[index].get(key)
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let index = hash(key)
        return tables[index].remove(key)
    }
}


class MyHashMap_1 {
    var key_set:Set<Int> = Set()
    var key_arr:[Int] = [Int]()
    var val_arr:[Int] = [Int]()
    /** Initialize your data structure here. */
    init() {

    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        if key_set.contains(key) {
            let idx = key_arr.firstIndex(of: key)!
            val_arr[idx] = value
            return
        }
        key_set.insert(key)
        key_arr.append(key)
        val_arr.append(value)
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        if key_set.contains(key) {
            let idx = key_arr.firstIndex(of: key)!
            return val_arr[idx]
        }
        return -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        let idx = key_set.firstIndex(of: key)
        if let idx = idx {
            key_set.remove(at: idx)
            let idx = key_arr.firstIndex(of: key)!
            key_arr.remove(at: idx)
            val_arr.remove(at: idx)
        }
    }
}
