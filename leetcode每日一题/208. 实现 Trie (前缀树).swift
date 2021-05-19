//
//  208. 实现 Trie (前缀树).swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/4.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Trie {
    private var root: TrieNode = TrieNode()
    private class TrieNode {
        var isEnd: Bool = false
        var links:[Character: TrieNode] = [Character: TrieNode]()
        init() {
        }
        
        func containsKey(_ char: Character) -> Bool {
            return links[char] != nil
        }
        
        func get(_ char: Character) -> TrieNode? {
            return links[char]
        }
        
        func put(_ char: Character, _ node: TrieNode) {
            links[char] = node
        }
    }

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node:TrieNode? = self.root
        for char in word {
            if !node!.containsKey(char) {
                node!.put(char, TrieNode())
            }
            node = node!.get(char)
        }
        node!.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        guard let node = searchPrefix(word) else {
            return false
        }
        return node.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        guard let _ = searchPrefix(prefix) else {
            return false
        }
        return true
    }
    
    private func searchPrefix(_ word: String) -> TrieNode? {
        var node:TrieNode? = self.root
        for char in word {
            if node!.containsKey(char) {
                node = node?.get(char)
            } else {
                return nil
            }
        }
        return node
    }
}
