/*
 * @lc app=leetcode.cn id=547 lang=swift
 *
 * [547] 朋友圈
 *
 * https://leetcode-cn.com/problems/friend-circles/description/
 *
 * algorithms
 * Medium (56.83%)
 * Likes:    288
 * Dislikes: 0
 * Total Accepted:    56.7K
 * Total Submissions: 98.3K
 * Testcase Example:  '[[1,1,0],[1,1,0],[0,0,1]]'
 *
 * 班上有 N 名学生。其中有些人是朋友，有些则不是。他们的友谊具有是传递性。如果已知 A 是 B 的朋友，B 是 C 的朋友，那么我们可以认为 A 也是
 * C 的朋友。所谓的朋友圈，是指所有朋友的集合。
 * 
 * 给定一个 N * N 的矩阵 M，表示班级中学生之间的朋友关系。如果M[i][j] = 1，表示已知第 i 个和 j
 * 个学生互为朋友关系，否则为不知道。你必须输出所有学生中的已知的朋友圈总数。
 * 
 * 示例 1:
 * 
 * 
 * 输入: 
 * [[1,1,0],
 * ⁠[1,1,0],
 * ⁠[0,0,1]]
 * 输出: 2 
 * 说明：已知学生0和学生1互为朋友，他们在一个朋友圈。
 * 第2个学生自己在一个朋友圈。所以返回2。
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: 
 * [[1,1,0],
 * ⁠[1,1,1],
 * ⁠[0,1,1]]
 * 输出: 1
 * 说明：已知学生0和学生1互为朋友，学生1和学生2互为朋友，所以学生0和学生2也是朋友，所以他们三个在一个朋友圈，返回1。
 * 
 * 
 * 注意：
 * 
 * 
 * N 在[1,200]的范围内。
 * 对于所有学生，有M[i][i] = 1。
 * 如果有M[i][j] = 1，则有M[j][i] = 1。
 * 
 * 
 */

// @lc code=start
fileprivate class UnionFind {
    private var count: Int = 0
    private lazy var parent: [Int] = {
        return [Int]()
    }()
    init(_ count: Int) {
        guard count > 0 else {
            return
        }
        self.count = count
        for i in 0 ..< count {
            self.parent.append(i)
        }
    }
    public func find(_ p: Int) -> Int {
        var p = p 
        while p != self.parent[p] {
            self.parent[p] = self.parent[parent[p]] // 进行路径压缩
            p = self.parent[p]
        }

        return p
    }
    public func union(_ p: Int, _ q: Int) {
        let pr = find(p), qr = find(q)
        if pr == qr {
            return
        }
        self.parent[pr] = qr
        self.count -= 1
    }

    public func getCount() -> Int {
        return self.count
    }
}


class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        guard M.count > 0 else {
            return 0
        }
        let n = M.count
        let uf = UnionFind(n)
        for i in 1 ..< M.count { 
            for j in 0 ..< i {
                if M[i][j] == 1 {
                    uf.union(i, j)
                }
            }
        }
        return uf.getCount()
    }
    func findCircleNum_1(_ M: [[Int]]) -> Int {
        guard M.count > 0 else {
            return 0
        }
        var res = 0, visited = [Bool](repeating: false, count: M.count)
        for i in 0 ..< M.count {
            if !visited[i] {
                dfs(M, &visited, i)
                res += 1
            }
        }
        return res
    }
    private func dfs(_ M: [[Int]], _ visited: inout [Bool], _ i: Int) {
        for j in 0 ..< M.count {
            if M[i][j] == 1 && !visited[j] {
                visited[j] = true
                dfs(M, &visited, j)
            }
        }
    }
}
// @lc code=end

