//
//  1008.先序遍历构造二叉树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_1008 {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else {
            return nil
        }
        var inorder  = preorder, map = [Int: Int]()
        quickSort(&inorder)
        for (i, v) in inorder.enumerated() {
            map[v] = i
        }
        func dfs(_ sp: Int, _ ep: Int, _ si: Int, _ ei: Int) -> TreeNode? {
            if sp > ep {
                return nil
            }
            let rootv = preorder[sp]
            let root = TreeNode(rootv)
            let indexRootV = map[rootv] ?? 0
            let count = indexRootV - si
            root.left = dfs(sp + 1, sp + count, si, indexRootV - 1)
            root.right = dfs(sp + count + 1, ep, indexRootV + 1, ei)
            return root
        }
        return dfs(0, preorder.count - 1, 0, inorder.count - 1)
    }

    private func quickSort(_ inorder: inout [Int]) {
        func quickSort_inner(_ left: Int, _ right: Int) {
            if left >= right {
                return
            }
            func partation() -> Int {
                var p = Int.random(in: left ... right)
                let pv = inorder[p]
                inorder.swapAt(right, p)
                p = left
                for j in left ..< right {
                    if inorder[j] < pv {
                        inorder.swapAt(j, p)
                        p += 1
                    }
                }
                inorder.swapAt(p, right)
                return p
            }
            let p = partation()
            quickSort_inner(left, p)
            quickSort_inner(p + 1, right)
        }
        quickSort_inner(0, inorder.count - 1)
    }
    
    func bstFromPreorder_1(_ preorder: [Int]) -> TreeNode? {
        var inorder = preorder
        quickSorted(&inorder)
        return bstFrom(preorder, inorder)
    }
    
    private func bstFrom(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var map = [Int: Int]()
        for (i,v) in inorder.enumerated() {
            map[v] = i
        }
        func itemTree(_ p_start: Int, _ p_end: Int, _ i_start: Int, _ i_end: Int) -> TreeNode? {
            if p_start > p_end {
                return nil
            }
            let root_v = preorder[p_start]
            let res = TreeNode(root_v)
            let rootvIndexIn = map[root_v] ?? 0
            let leftCount = rootvIndexIn - i_start
            
            res.left = itemTree(p_start + 1, p_start + leftCount, i_start, rootvIndexIn - 1)
            res.right = itemTree(p_start + leftCount + 1, p_end, rootvIndexIn + 1, i_end)
            return res
        }
        return itemTree(0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    private func quickSorted(_ inorder: inout [Int]) {
        func quickSorted_inner(_ left: Int, _ right: Int) {
            if left >= right {
                return
            }
            func partacion() -> Int {
                var p = Int.random(in: left ... right)
                let pv = inorder[p]
                inorder.swapAt(p, right)
                p = left
                for i in left ..< right {
                    if inorder[i] < pv {
                        inorder.swapAt(i, p)
                        p += 1
                    }
                }
                inorder.swapAt(p, right)
                return p
            }
            
            let p = partacion()
            quickSorted_inner(left, p)
            quickSorted_inner(p + 1, right)
        }
        
        quickSorted_inner(0, inorder.count - 1)
    }
}
