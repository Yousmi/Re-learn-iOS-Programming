/*
 * @lc app=leetcode.cn id=208 lang=swift
 *
 * [208] 实现 Trie (前缀树)
 *
 * https://leetcode-cn.com/problems/implement-trie-prefix-tree/description/
 *
 * algorithms
 * Medium (67.22%)
 * Likes:    362
 * Dislikes: 0
 * Total Accepted:    47.9K
 * Total Submissions: 70.3K
 * Testcase Example:  '["Trie","insert","search","search","startsWith","insert","search"]\n' +
  '[[],["apple"],["apple"],["app"],["app"],["app"],["app"]]'
 *
 * 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。
 * 
 * 示例:
 * 
 * Trie trie = new Trie();
 * 
 * trie.insert("apple");
 * trie.search("apple");   // 返回 true
 * trie.search("app");     // 返回 false
 * trie.startsWith("app"); // 返回 true
 * trie.insert("app");   
 * trie.search("app");     // 返回 true
 * 
 * 说明:
 * 
 * 
 * 你可以假设所有的输入都是由小写字母 a-z 构成的。
 * 保证所有输入均为非空字符串。
 * 
 * 
 */

// @lc code=start

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

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
// @lc code=end

