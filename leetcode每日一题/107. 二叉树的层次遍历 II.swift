//
//  107. 二叉树的层次遍历 II.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/23.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_107 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var res = [[Int]]()

        var array = [TreeNode]()
        array.append(root)
        while array.count > 0 {

            let size = array.count
            var level = [Int]()
            for _ in 0 ..< size {

                let node = array.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    array.append(left)
                }
                if let right = node.right {
                    array.append(right)
                }
            }
            // res.insert(level, at: 0) //要这个就不要下面的交换
            res.append(level)
        }
        return res.reversed()
        /*
        var i = 0, j = res.count - 1;
        while i < j {
            (res[i], res[j]) = (res[j], res[i])
            i+=1
            j-=1
        }

        return res
        */
        
    }
}
