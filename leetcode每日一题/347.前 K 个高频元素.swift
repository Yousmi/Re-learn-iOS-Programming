//
//  347.前 K 个高频元素.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_347 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 && k > 0 else {
            return []
        }
        var nums = nums, map = [Int: Int]() // num : count
        for i in nums {
            map[i] = (map[i] ?? 0 ) + 1
        }
        var bucket = [[Int]](repeating: [Int](), count: nums.count + 1)//下标识出现的次数
        for (k, v) in map {
            bucket[v].append(k)
        }
        
        var res = [Int](), i = bucket.count - 1
        while i >= 0 {
            if res.count < k {
                if bucket[i].count != 0 {
                    res.append(contentsOf: bucket[i])
                }
            } else {
                break
            }
            i -= 1
        }
        
        return res
    }
    //快排核心思想：必要的2个函数 1、分区函数、 2、排序函数
    //1、选取分区点，每一次分区时候至少有一位找到了合适的位置， 每一次分区时候，选取最右边为分区点，每次都需要从左往右枚举，
    //另外在开一个标记，记录记录上一个比分区小的位置，每次发现比分区值小的，就直接交换枚举的左边界 和记录的上一个交换的值，
    //返回记录的交换位置
    private func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        if left > right {
            return
        }
        let part = partation(&nums, left, right)
        quickSort(&nums, 0, part - 1)
        quickSort(&nums, part + 1, right)
    }

    private func partation(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let p = Int.random(in: left ... right)
        let pv = nums[p]
        nums.swapAt(p, right)
        var i = left, l = left, r = right
        while l < r {
            if nums[l] < pv {
                nums.swapAt(i, l)
                i += 1
            }
            l += 1
        }
        nums.swapAt(i, right)
        return i
    }
}
