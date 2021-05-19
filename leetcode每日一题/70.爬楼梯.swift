//
//  70.爬楼梯.swift
//  INTERVIEW
//
//  Created by Scan on 2020/6/22.
//  Copyright © 2020 钱志新. All rights reserved.
//
/*
假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

注意：给定 n 是一个正整数。
 
*/
import Foundation

class Solution_70 {
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else {
            return n
        }
        var map = [Int: Int]()
        map[0] = 0
        map[1] = 1
        map[2] = 2
        for i in 3 ... n {
            map[i] = map[i - 1]! + map[i - 2]!
        }
        return map[n]!
    }
    
    func climbStairs_3(_ n: Int) -> Int {
        
        guard n > 2 else {
            return n
        }
        var fn_1 = 1, fn_2 = 2, fn_3 = 3
        for _ in 3...n {
            fn_3 = fn_2 + fn_1
            fn_1 = fn_2
            fn_2 = fn_3
        }
        return fn_3
//
//        var temp = [Int](repeating: 0, count: n + 1)
//
//        return _climbStairs(n, &temp)
    }
    
    
    
    
    
    
    
    
    
    // MARK:- 递归
    func climbStairs_1(_ n: Int) -> Int {
        var temp = [Int](repeating: 0, count: n + 1)
        return _climbStairs(n, &temp)
    }
    
    private func _climbStairs(_ n: Int, _ a: inout [Int]) ->Int {
        if a[n] > 0 {
            return a[n]
        }
        if n == 1 {
            a[n] = 1
        }
        else if n == 2 {
            a[n] = 2
        } else {
            a[n] = _climbStairs(n-1, &a) + _climbStairs(n-2, &a)
        }
        return a[n]
    }
    
    
    
    
    
    // MARK:- 递归 -2
    func climbStairs_2(_ n: Int) -> Int {
        guard n > 1 else {
            return 0
        }
        var map = [Int: Int]()
        map[1] = 1
        map[2] = 2
        return _climbStairs_2(n, &map)
    }
    private func _climbStairs_2(_ n: Int, _ map: inout [Int: Int]) -> Int {
        if map[n] != nil {
            return map[n]!
        }
        map[n - 1] =  _climbStairs_2(n - 1, &map)
        map[n - 2] =  _climbStairs_2(n - 2, &map)
        return map[n - 1]! + map[n - 2]!
    }
}
