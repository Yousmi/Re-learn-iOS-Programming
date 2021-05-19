//
//  46.全排列.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

//给定一个 没有重复 数字的序列，返回其所有可能的全排列。
import Foundation

class Solution_46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return []
        }
        var res = [[Int]](), temp = [Int]()
        var visited = [Bool](repeating: false, count: nums.count)
        func dfs(_ level: Int) {
            if level == nums.count {
                res.append(temp)
                return
            }
            for i in 0 ..< nums.count {
                if !visited[i] {
                    visited[i] = true
                    temp.append(nums[i])
                    dfs(level + 1)
                    _ = temp.popLast()
                    visited[i] = false
                }
            }
        }
        dfs(0)
        return res
    }
    func permute_1(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return []
        }
        var res = [[Int]]()
        func dfs(_ arr:[Int], _ level: Int) {
            if level == nums.count {
                res.append(arr)
                return
            }
            for i in 0 ..< nums.count {
                if !arr.contains(nums[i]) { //这里满足不了有相同的元素 虽然可以 AC
                    var arr = arr
                    arr.append(nums[i])
                    dfs(arr, level + 1)
                    arr.removeAll()
                }
            }
        }
        dfs([], 0)
        return res
    }
}
