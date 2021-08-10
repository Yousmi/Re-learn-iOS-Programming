/*
 * @lc app=leetcode.cn id=215 lang=swift
 *
 * [215] 数组中的第K个最大元素
 *
 * https://leetcode-cn.com/problems/kth-largest-element-in-an-array/description/
 *
 * algorithms
 * Medium (62.57%)
 * Likes:    608
 * Dislikes: 0
 * Total Accepted:    168K
 * Total Submissions: 260.7K
 * Testcase Example:  '[3,2,1,5,6,4]\n2'
 *
 * 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 * 
 * 示例 1:
 * 
 * 输入: [3,2,1,5,6,4] 和 k = 2
 * 输出: 5
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 * 输出: 4
 * 
 * 说明: 
 * 
 * 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 * 
 */

// @lc code=start
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 0 && k >= 1 && k <= nums.count  else {
            return 0
        }
        var temp = nums
        return quickSort(&temp, 0, temp.count - 1, nums.count - k)
    }
    
    private func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
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

    // func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
         
    //     return nums.sorted()[nums.count - k]
    // }
    
    func findKthLargest_5(_ nums: [Int], _ k: Int) -> Int {
        // 自己维护大顶堆，最大的放前面 ，自己实现快排，自己维护堆
        var queue = Array(repeating: 0, count: k)
        var i = 0
        while i < nums.count {
            if i < k {
                queue[i] = nums[i]
                if i == k - 1 {
                    quickSort_1(&queue, 0, queue.count - 1)
                }
            } else {
                if queue.first! < nums[i] {
                    let index = findIndex(&queue, nums[i])
                    if index != -1 {
                        var j = 0
                        while j <= index - 1 {
                            queue[j] = queue[j + 1]
                            j += 1
                        }
                        queue[index] = nums[i]
                    }
                }
            }
            i += 1
        }
        return queue.first!
    }

    private func findIndex(_ arr: inout [Int], _ value: Int) -> Int {
        if arr[arr.count - 1] <= value {
                return arr.count - 1
        } else  {
            for i in  0 ..< arr.count - 1 {
                if arr[i] <= value && arr[i + 1] > value {
                    return i
                }
            }
        }
        return -1
    }
    
    
    //MARK: - 
    func findKthLargest_1(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 0 && k >= 1 && k <= nums.count else {
            return -1
        }
        // 直接快排 ，取值
        var queue = nums 
        quickSort_1(&queue, 0, queue.count - 1)
        return queue[queue.count - k]
    }
    
    //快排
    private func quickSort_1(_ arr: inout [Int], _ p: Int, _ q: Int) {
        if p >= q {
            return
        }
        let i = partition_1(&arr, p, q)
        quickSort_1(&arr, p, i - 1)
        quickSort_1(&arr, i + 1, q)
    }
    //分区函数
    private func partition_1(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
        var pivotIndex = Int.random(in: left...right)
        let voite = arr[pivotIndex]
        arr.swapAt(pivotIndex, right)
        var l = left
        for j in left ..< right {
            if arr[j] < voite {
                arr.swapAt(l, j)
                l += 1
            }
        }
        if arr[l] != arr[right] {
            arr.swapAt(l, right)
        }
        return l
    }
    

    func findKthLargest_2(_ nums: [Int], _ k: Int) -> Int {
         if k > nums.count {
             return 0
         }
         var temp = nums
         return quickSelect_2(&temp, 0, temp.count - 1, temp.count - k)
     }
    func quickSelect_2(_ nums: inout [Int], _ begin: Int, _ end: Int, _ targetIndex: Int) -> Int {
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
             return quickSelect_2(&nums, begin, l - 1, targetIndex)
         } else {
             return quickSelect_2(&nums, l + 1, end, targetIndex)
         }

     }
     func swap(_ nums: inout [Int], _ a: Int, _ b: Int) {
         (nums[a], nums[b]) = (nums[b], nums[a])
     }
    

    func findKthLargest_3(_ nums: [Int], _ k: Int) -> Int {
        guard k >= 0 && k <= nums.count else {
            return -1
        }
        var temp = nums.sorted()
        return temp[nums.count - k]
    }


    func findKthLargest_4(_ nums: [Int], _ k: Int) -> Int { 
        var temp = nums
        quickSort_4(&temp, 0, temp.count - 1) 
        return temp[temp.count - k]
    }
    private func quickSort_4(_ array: inout [Int], _ left:Int, _ right: Int) {
        if left >= right {
            return 
        }
        let part = partition_4(&array, left, right)
        quickSort_4(&array, left, part - 1)
        quickSort_4(&array, part, right)
    }

    private func partition_4(_ array: inout [Int], _ left:Int, _ right: Int) -> Int {
        let povid = Int.random(in: left ... right)
        let povidValue = array[povid]
        array.swapAt(povid, right)
        var i = left
        for j in left ... right {
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
// @lc code=end

