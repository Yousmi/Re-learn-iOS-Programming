//
//  589. N叉树的前序遍历.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation
class Solution_589 {
    //递归
    func preorder(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }
        var res = [Int]()
        res.append(root!.val) //位置的不同
        if root!.children.count > 0 {
            for i in root!.children {
                let t = preorder(i)
                res.append(contentsOf: t)
            }
        }
        return res
    }
    //迭代
    func preorder_1(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }
        var stack = [Node](), res = [Int]()
        stack.append(root!)
        while stack.count > 0 {
            let node = stack.popLast()!
            res.append(node.val)
            let c = node.children.count
            if (c > 0) {
                for i in 0 ..< c {
                    stack.append(node.children[c - i - 1])
                }
            }
        }
        return res
    }
}
