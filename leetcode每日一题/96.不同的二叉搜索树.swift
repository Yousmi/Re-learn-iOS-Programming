//
//  96.不同的二叉搜索树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/20.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_96 {
    //思路 1、假设n个节点存在二叉排序树的个数是G(n)，令f(i)为以i为根的二叉搜索树的个数, 则 G(n) = f(1) + f(2) + ... + f(n)
    // 2、当i为根节点时，其左子树节点个数为i-1个，右子树节点为n-i ,则 f(i)=G(i−1)∗G(n−i)
    // 3、 得出 G(n)=G(0)∗G(n−1)+G(1)∗(n−2)+...+G(n−1)∗G(0)
    //给定序列 1 \cdots n1⋯n，我们选择数字 ii 作为根，则根为 ii 的所有二叉搜索树的集合是左子树集合和右子树集合的笛卡尔积，对于笛卡尔积中的每个元素，加上根节点之后形成完整的二叉搜索树，
    func numTrees(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2 ... n {
            for j in 1 ... i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        return dp[n]
    }
}
