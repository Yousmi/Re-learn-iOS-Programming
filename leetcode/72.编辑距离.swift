/*
 * @lc app=leetcode.cn id=72 lang=swift
 *
 * [72] 编辑距离
 *
 * https://leetcode-cn.com/problems/edit-distance/description/
 *
 * algorithms
 * Hard (59.75%)
 * Likes:    1090
 * Dislikes: 0
 * Total Accepted:    78.9K
 * Total Submissions: 132.1K
 * Testcase Example:  '"horse"\n"ros"'
 *
 * 给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。
 * 
 * 你可以对一个单词进行如下三种操作：
 * 
 * 
 * 插入一个字符
 * 删除一个字符
 * 替换一个字符
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：word1 = "horse", word2 = "ros"
 * 输出：3
 * 解释：
 * horse -> rorse (将 'h' 替换为 'r')
 * rorse -> rose (删除 'r')
 * rose -> ros (删除 'e')
 * 
 * 
 * 示例 2：
 * 
 * 输入：word1 = "intention", word2 = "execution"
 * 输出：5
 * 解释：
 * intention -> inention (删除 't')
 * inention -> enention (将 'i' 替换为 'e')
 * enention -> exention (将 'n' 替换为 'x')
 * exention -> exection (将 'n' 替换为 'c')
 * exection -> execution (插入 'u')
 * 
 * 
 */

// @lc code=start


 class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1.count > 0 && word2.count > 0 else {
            return max(word1.count, word2.count)
        }
        let m = word1.count, n = word2.count
        let mArray = Array(word1), nArray = Array(word2)
        //dp[i][j] 表示单词1的前 i 个字符变换到 单词2 的前 j 个字符的最小步数
        // if i j字符相同 dp[i][j] = dp[i - 1][j - 1]
        // else 周围的最小值  + 1
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 1 ... m {//列
            dp[i][0] = dp[i - 1][0] + 1
        }
        for j in 1 ... n {//行
            dp[0][j] = dp[0][j - 1] + 1
        }
        for i in 1 ... m {
            for j in 1 ... n {
                if mArray[i - 1] == nArray[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i][j - 1], dp[i - 1][j])) + 1
                }
            }
        }
        return dp[m][n]
    }

    func minDistance_1(_ word1: String, _ word2: String) -> Int {
        guard word1.count != 0 && word2.count != 0 else {
            return max(word1.count, word2.count)
        }
        let one = Array(word1), two = Array(word2)
        var dp = [[Int]](repeating:[Int](repeating:0, count:two.count + 1), count: one.count + 1)
        for i in 1 ... one.count {
            dp[i][0] = dp[i - 1][0] + 1
        }
        for j in 1 ... two.count {
            dp[0][j] = dp[0][j - 1] + 1
        }
        for i in 1 ... one.count {
            for j in 1 ... two.count {
                if one[i - 1] == two[j - 1] { //相同就看前一个字符的变换
                    dp[i][j] = dp[i - 1][j - 1]  
                } else {//不同就是周围的最小值 + 1
                    dp[i][j] = min(dp[i - 1][j - 1], min(dp[i][j - 1], dp[i - 1][j])) + 1 
                }    
            }
        }
        return dp[word1.count][word2.count]
    }
}
// @lc code=end

