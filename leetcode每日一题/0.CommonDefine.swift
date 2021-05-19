//
//  0.CommonDefine.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/26.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
     self.val = val
     self.children = []
    }
}


//未解答的题目记录
//77 、120、 387、54、 61 、79 、 10 、42 、 127， 290、 440， 541、 557、 567、 889、 1008 、 387, 191
