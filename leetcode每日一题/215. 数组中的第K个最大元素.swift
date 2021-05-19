//
//  215. 数组中的第K个最大元素.swift
//  INTERVIEW
//
//  Created by Scan on 2020/7/13.
//  Copyright © 2020 钱志新. All rights reserved.
//

//在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
import Foundation

class Solution_215 {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 0 && k >= 1 && k <= nums.count  else {
            return 0
        }
        var temp = nums
        return quickSort(&temp, 0, temp.count - 1, nums.count - k)
    }
    
    private func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        if left >= right {
            return -1
        }
        let p = partation(&nums, left, right)
        if p == target {
            return nums[p]
        } else if (target > p ) {
            return quickSort(&nums, p + 1, right, target)
        } else {
            return quickSort(&nums, 0, p - 1, target)
        }
    }
    
    private func partation(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let p = Int.random(in: left ... right)
        let pv = nums[p]
        nums.swapAt(p, right)
        var i = left
        for j in left ..< right {
            if nums[j] < pv {
                nums.swapAt(i, j)
                i += 1
            }
        }
        nums.swapAt(i, right)
        return i
    }
    
    
    
    
    //MARK: - 1 时间很长
    func findKthLargest_2(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 0 && k >= 1 && k <= nums.count else {
            return -1
        }
        var queue = Array(repeating: 0, count: k)
        var i = 0
        while i < nums.count {
            if i < k {
                queue[i] = nums[i]
                if i == k - 1 {
                    quickSort(&queue, 0, queue.count - 1)
                }
            } else {
                if queue.first! < nums[i] {
                    let index = findIndex(&queue, nums[i])
                    var j = 0
                    while j <= index - 1 {
                        queue[j] = queue[j + 1]
                        j += 1
                    }
                    queue[index] = nums[i]
                }
            }
            i += 1
        }
        
        return queue.first!
    }
    
    private func findIndex(_ arr: inout [Int], _ value: Int) -> Int {
        if arr[arr.count - 1] <= value {
            return arr.count - 1
        } else {
            for i in  0 ..< arr.count - 1 {
                if arr[i] <= value && arr[i + 1] > value {
                    return i
                }
            }
        }
        return -1
    }
    
    private func quickSort(_ arr: inout [Int], _ p: Int, _ q: Int) {
        if p >= q {
            return
        }
        let i = partation(&arr, p, right: q)
        quickSort(&arr, p, i - 1)
        quickSort(&arr, i + 1, q)
    }
    
    private func partation(_ arr: inout [Int], _ left: Int, right: Int) -> Int {
        var index = left
        let voite = arr[right]
        for j in left ..< right {
            if arr[j] < voite {
                arr.swapAt(index, j)
                index += 1
            }
        }
        if arr[index] != arr[right] {
            arr.swapAt(index, right)
        }
        return index
    }
    
    //MARK: - 2 很好了，优化点 ： 快排的分区函数选择  在原数组里面直接操作不存在额外操作
    func findKthLargest_1(_ nums: [Int], _ k: Int) -> Int {
         if k > nums.count {
             return 0
         }
         var temp = nums
         return quickSelect(&temp, 0, temp.count - 1, temp.count - k)
     }

    
    func quickSelect(_ nums: inout [Int], _ begin: Int, _ end: Int, _ targetIndex: Int) -> Int {
         if begin == end {
             return nums[begin]
         }

         let pivotIndex = Int.random(in: begin...end)
         let pivot = nums[pivotIndex]
         swap(&nums, pivotIndex, end)

         var l = begin
         for i in begin...end {
             if nums[i] < pivot {
                 swap(&nums, l, i)
                 l += 1
             }
         }
         swap(&nums, l, end)
        
         if l == targetIndex {
             return nums[l]
         } else if l > targetIndex {
             return quickSelect(&nums, begin, l - 1, targetIndex)
         } else {
             return quickSelect(&nums, l + 1, end, targetIndex)
         }
     }


     func swap(_ nums: inout [Int], _ a: Int, _ b: Int) {
         (nums[a], nums[b]) = (nums[b], nums[a])
     }
    
    //MARK: - 3
    func findKthLargest_3(_ nums: [Int], _ k: Int) -> Int {
        var temp = nums
        quickSort_3(&temp, 0, temp.count - 1)
        return temp[temp.count - k]
    }
    private func quickSort_3(_ array: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        let part = partition_3(&array, left, right)
        quickSort_3(&array, left, part - 1)
        quickSort_3(&array, part + 1, right)
    }

    private func partition_3(_ array: inout [Int], _ left:Int, _ right: Int) -> Int {
        let povid = Int.random(in: left ... right)
        let povidValue = array[povid]
        array.swapAt(povid, right)
        var i = left
        for j in left ..< right {
            if array[j] < povidValue {
                array.swapAt(i, j)
                i += 1
            }
        }
        if array[i] != array[right] {
            array.swapAt(i, right)
        }
        return i
    }
}
