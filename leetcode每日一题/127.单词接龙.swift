/*
 * @lc app=leetcode.cn id=127 lang=swift
 *
 * [127] 单词接龙
 *
 * https://leetcode-cn.com/problems/word-ladder/description/
 *
 * algorithms
 * Medium (41.86%)
 * Likes:    378
 * Dislikes: 0
 * Total Accepted:    49.5K
 * Total Submissions: 115.5K
 * Testcase Example:  '"hit"\n"cog"\n["hot","dot","dog","lot","log","cog"]'
 *
 * 给定两个单词（beginWord 和 endWord）和一个字典，找到从 beginWord 到 endWord
 * 的最短转换序列的长度。转换需遵循如下规则：
 * 
 * 
 * 每次转换只能改变一个字母。
 * 转换过程中的中间单词必须是字典中的单词。
 * 
 * 
 * 说明:
 * 
 * 
 * 如果不存在这样的转换序列，返回 0。
 * 所有单词具有相同的长度。
 * 所有单词只由小写字母组成。
 * 字典中不存在重复的单词。
 * 你可以假设 beginWord 和 endWord 是非空的，且二者不相同。
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * beginWord = "hit",
 * endWord = "cog",
 * wordList = ["hot","dot","dog","lot","log","cog"]
 * 
 * 输出: 5
 * 
 * 解释: 一个最短转换序列是 "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 * ⁠    返回它的长度 5。
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * beginWord = "hit"
 * endWord = "cog"
 * wordList = ["hot","dot","dog","lot","log"]
 * 
 * 输出: 0
 * 
 * 解释: endWord "cog" 不在字典中，所以无法进行转换。
 * 
 */

// @lc code=start
class Solution_127 {
    //bfs 一定要想到队列
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let letters = Array("abcdefghijklmnopqrstuvwxyz")
        var wordSet = Set(wordList)
        wordSet.remove(beginWord)

        var queue = [String](), visited = Set<String>()
        queue.append(beginWord)
        visited.insert(beginWord)
        var step = 1
        while !queue.isEmpty {
            for _ in 0 ..< queue.count {
                let temp = queue.removeFirst()
                var tempArray = Array(temp)
                for i in 0 ..< tempArray.count {
                    let ori = tempArray[i]
                    for k in letters {
                        if k == ori {
                            continue
                        }
                        tempArray[i] = k
                        let nextword = String(tempArray)
                        if wordSet.contains(nextword) {
                            if nextword == endWord {
                                return step + 1
                            }
                            if !visited.contains(nextword) {
                                queue.append(nextword)
                                visited.insert(nextword)
                            }
                        }
                    }
                    tempArray[i] = ori
                }
            }
            step += 1
        }
        return 0
    }
}
// @lc code=end

