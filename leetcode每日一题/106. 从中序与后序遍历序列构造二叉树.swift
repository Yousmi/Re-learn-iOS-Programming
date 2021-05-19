//
//  106. 从中序与后序遍历序列构造二叉树.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/12.
//  Copyright © 2020 钱志新. All rights reserved.
//

//根据一棵树的中序遍历与后序遍历构造二叉树。
//
//注意:
//你可以假设树中没有重复的元素。

import Foundation

//在找到根节点位置以后，我们要确定下一轮中，左子树和右子树在中序数组和后续数组中的左右边界的位置。
//
//左子树-中序数组 is = is, ie = ri - 1
//左子树-后序数组 ps = ps, pe = ps + ri - is - 1 (pe计算过程解释，后续数组的起始位置加上左子树长度-1 就是后后序数组结束位置了，左子树的长度 = 根节点索引-左子树)
//右子树-中序数组 is = ri + 1, ie = ie
//右子树-后序数组 ps = ps + ri - is, pe - 1

class Solution_106 {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0 && inorder.count == postorder.count else {
            return nil
        }
        var map = [Int: Int]()
        for (i, v) in inorder.enumerated() {
            map[v] = i
        }
        func build(_ si: Int, _ ei: Int, _ sp:Int, _ ep: Int) -> TreeNode? {
            if si > ei {
                return nil
            }
            let rootv = postorder[ep]
            let rootIndex = map[rootv] ?? si
            let res = TreeNode(rootv)
            let count = rootIndex - si
            res.left = build(si, rootIndex - 1, sp, sp + count - 1)
            res.right = build(rootIndex + 1, ei, sp + count, ep - 1)
            return res
        }
        return build(0, inorder.count - 1, 0, postorder.count - 1)
    }
    
    func buildTree_1(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard inorder.count > 0 else {
            return nil
        }
        return dfs(inorder, postorder)
    }
    
    private func dfs(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if inorder.count == 0 {
            return nil
        }
        let root = TreeNode(postorder[postorder.count - 1])
        for i in 0 ..< inorder.count {
            if inorder[i] == postorder[postorder.count - 1] {

                let inLeft = Array<Int>(inorder[0 ..< i])
                let inRight = Array<Int>(inorder[i + 1 ..< inorder.count])

                let poLeft = Array<Int>(postorder[0 ..< i])
                let poRight = Array<Int>(postorder[i ..< postorder.count - 1])

                root.left = dfs(inLeft, poLeft);
                root.right = dfs(inRight, poRight);
                break
            }
        }
        return root
    }
    
    
    
}
