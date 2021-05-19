//
//  145.二叉树的后序遍历.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_145 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var res = [Int](), stack = [TreeNode].init(arrayLiteral: root!)
        while stack.count > 0 {
            let temp = stack.popLast()!
            res.append(temp.val)
            if temp.left != nil {
                stack.append(temp.left!)
            }
            if temp.right != nil {
                stack.append(temp.right!)
            }
        }
        return res.reversed()
    }
}
