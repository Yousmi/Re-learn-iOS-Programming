//
//  剑指 Offer 40. 最小的k个数.swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/8/5.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_O_40 {
    //1.最简单的方法就是 快排 后 取前 k个
    //2、使用快速排序。找到第K大的元素下标，
    func smallestK(_ arr: [Int], _ k: Int) -> [Int] {
        var copy =  arr
        var reuslt = [Int]()
        _ = quickSelect(array: &copy, left:0, right:arr.count - 1, k: k)
        for i in 0 ..< k {
              reuslt.append(copy[i])
        }
        return reuslt
    }
    //找第K大元素的下标
    func quickSelect(array: inout [Int], left: Int, right: Int, k: Int) ->Int{
        if left >= right {
            return left
        }
        let index = partition(array: &array, left: left, right: right)
        //判断左侧部分元素个数，从而知道轴值第所处的位置【假设轴值左侧是大值，右侧是小值】
        let size = index - left + 1
        //正好找到
        if size == k {
            return index
        }
        //找多了，往左侧找
        else if size > k {
            return quickSelect(array: &array, left: left, right: index - 1, k: k )
        }else{
            return quickSelect(array: &array, left: index + 1, right: right, k: k - size)
        }
    }

    func partition(array: inout [Int], left: Int, right: Int) ->Int{
        //选定轴值
        let pivot = array[right]
        var inerLeft = left
        var inerRight = right
        while inerLeft != inerRight {
            //从左边找一个比轴值大的元素，他应该被搬到右边
            while array[inerLeft] < pivot && inerLeft < inerRight{
                inerLeft = inerLeft + 1
            }
            //找到一个
            if inerLeft < inerRight {
                let temp = array[inerLeft]
                array[inerLeft] = array[inerRight]
                array[inerRight] = temp
                inerRight = inerRight - 1
            }
            //再从右边找第一个比轴值小、相等的元素
            while array[inerRight] > pivot && inerLeft < inerRight {
                inerRight = inerRight - 1
            }
            //假设找到一个
            if inerLeft < inerRight {
                let temp = array[inerLeft]
                array[inerLeft] = array[inerRight]
                array[inerRight] = temp
                inerLeft = inerLeft + 1
            }
        }
        //最后 inerLeft == inerRi位置ght，就是轴值得位置
        array[inerLeft] = pivot
        return inerLeft
    }
    
    func smallestK_1(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count < k {
            return nums
        }

        if k == 0 {
            return []
        }
        
        var kHeap = [Int]()
        for i in nums {
            if k > kHeap.count {
                kHeap.append(i)
                if k == kHeap.count {
                    buildHeap(&kHeap)
                }
            } else {
                insert(&kHeap, i)
            }
        }
        sortHeap(&kHeap)
        return kHeap
    }

    func sortHeap(_ num: inout [Int]){
        for i in (0 ..< num.count).reversed() {
            let temp = num[0]
            num[0] = num[i]
            num[i] = temp
            heapify(&num,0,i)
        }
    }
    
    func buildHeap(_ num: inout [Int]){
        for i in (0 ..< (num.count)/2).reversed() {
            heapify(&num,i,num.count)
        }
    }
    
    func heapify(_ num: inout [Int],_ k: Int,_ count: Int){
        let leftChild = 2 * k + 1
        if leftChild >= count {
            return
        }
        
        var needSwapIndex = k
        if num[leftChild] > num[k]{
            needSwapIndex = leftChild
        }
        
        let rightChild = 2 * k + 2
        if rightChild < count && num[rightChild] > num[k] && num[rightChild] > num[leftChild] {
            needSwapIndex = rightChild
        }
        
        if needSwapIndex != k {
            let temp = num[needSwapIndex]
            num[needSwapIndex] = num[k]
            num[k] = temp
            heapify(&num,needSwapIndex,count)
        }
    }
    
    func insert(_ num: inout [Int],_ i: Int){
        let temp = num[0]
        if i < temp {
            num[0] = i
            heapify(&num, 0, num.count)
        }
    }
}
