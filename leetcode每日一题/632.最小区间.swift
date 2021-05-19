//
//  632.最小区间.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/1.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_632 {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        let size = nums.count
        var map = [Int: [Int]](), xMin = Int.max, xMax = Int.min
        for i in 0 ..< size {
            for x in nums[i] {
                var item: [Int]?
                if let v = map[x] {
                    item = v
                } else {
                    item = [Int]()
                }
                item!.append((i))
                map[x] = item!
                xMin = min(xMin, x)
                xMax = max(xMax, x)
            }
        }
        var freq = [Int](repeating: 0, count: size)
        var inside = 0, left = xMin, right = xMin - 1
        var bLeft = xMin, bRight = xMax
        while right < xMax {
            right += 1
            if map.keys.contains(right) {
                for x in map[right]! {
                    freq[x] += 1
                    if freq[x] == 1 {
                        inside += 1
                    }
                }
                while inside == size {
                    if right - left < bRight - bLeft {
                        bLeft = left
                        bRight = right
                    }
                    if map.keys.contains(left) {
                        for x in map[left]! {
                            freq[x] -= 1
                            if freq[x] == 0 {
                                inside -= 1
                            }
                        }
                    }
                    left += 1
                }
            }
        }
        return [bLeft, bRight]
    }
    //MARK: - 下面算法是错的
    /*
    func smallestRange_1(_ nums: [[Int]]) -> [Int] {
        guard nums.count > 0 else {
            return []
        }
        let k = nums.count
        
        var mapArr = [[Int: Int]]()
        var tempNums = [Int]()
        for (i, item) in nums.enumerated() {
            var map = [Int: Int]()
            for v in item {
                map[v] = i
            }
            mapArr.append(map)
            tempNums.append(contentsOf: item)
        }
        tempNums.sort()
        
        var begins = [[Int]]()
        for i in 0 ... tempNums.count - k {
            var m = 0, mapQueue = mapArr
            for j in 0 ..< k {
                let v = tempNums[i + j]
                var mached = -1
                for itemMap in 0 ..< mapQueue.count {
                    let map = mapQueue[itemMap]
                    if map[v] != nil {
                        m += 1
                        mached = itemMap
                        break
                    }
                }
                if mached != -1 {
                    mapQueue.remove(at: mached)
                }
                
            }
            if m == k {
                begins.append([tempNums[i], tempNums[i + k - 1]])
            }
        }
        
        var res = [Int]()
        if begins.count > 0 {
            res = begins[0]
            for i in 1 ..< begins.count {
                let item = begins[i]
                res = (res[1] - res[0] <= item[1] - item[0]) ? res : item
            }
        }
        return res
    }
    */
}
