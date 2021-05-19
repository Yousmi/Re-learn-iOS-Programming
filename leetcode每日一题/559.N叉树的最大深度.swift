//
//  559.N叉树的最大深度.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/17.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_559 {
    func maxDepth(_ root: Node?) -> Int {
        return dfs(root)
    }
    
    //dfs
    private func dfs(_ root: Node?) -> Int {
        if root == nil {
            return 0
        }
        var level = 0
        for i in root!.children {
            level = max(level, dfs(i))
        }
        
        return level + 1
    }
    
    //bfs
    private func bfs(_ root: Node?) -> Int {
        guard root != nil else {
            return 0
        }
        var queue:[Node] = [root!], res = 0
        while !queue.isEmpty {
            res += 1
            for _ in 0 ..< queue.count {
                let first = queue.removeFirst()
                queue.append(contentsOf:first.children)
            }
        }
        return res
    }
}
