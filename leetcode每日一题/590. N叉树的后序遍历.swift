//
//  590. N叉树的后序遍历.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_590 {
    func postorder(_ root: Node?) -> [Int] {
        var res = [Int]()
        _postorder(root, &res)
        return res
    }
    private func _postorder(_ root: Node?, _ res: inout [Int]) {
        if root == nil {
            return
        }
        for node in root!.children {
           _postorder(node, &res)
        }
        res.append(root!.val)
    }
    
    func postorder_1(_ root: Node?) -> [Int] {
        guard root != nil else {
            return []
        }
        var res = [Int](), stack = [Node]()
        stack.append(root!)
        while stack.count > 0 {
            let node = stack.popLast()!
            res.append(node.val)
            if node.children.count > 0 {
                for i in 0 ..< node.children.count {
                    stack.append(node.children[i])
                }
            }
        }
        
        return res.reversed()
    }
}
