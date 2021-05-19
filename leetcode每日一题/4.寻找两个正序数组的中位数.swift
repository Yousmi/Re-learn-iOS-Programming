//
//  4.寻找两个正序数组的中位数.swift
//  Interview
//
//  Created by Scan on 2020/6/14.
//  Copyright © 2020 Scan. All rights reserved.

/*
 优化步骤
 1、什么情况下发现问题
 2、是如何测量
 3、如何解决
    根据业务去梳理
 4、解决的结果
 
 缺陷：
 1、是怎么发现的
 2、会造成什么影响
 3、如何解决的
 4、解决后是如何跟进
 
 1、测量工具
 
 网络：
 1、网络启动
 2、页面访问速度
 
 数据库处理
 
 组件化
 
 启动优化
 
 网络优化
 
 调试技巧
 
 Crash
 1、如何定位
 2、如何解决
 
 
 要结合项目
 
 启动优化
 1、如何测量
 2、
 
 
 解决问题的思路
 
 
 下套路-> 往自己熟悉的地方带进去，才有话聊
 
 
 */
//

import Foundation

class Solution_4 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        //方法一：
        /*中线法
         * 满足条件 1、A B 两有序数组
         *         2、 A 的左边最大值 <= B 的右边最小值 && A的右边 最小值 <= B 的左边最大值
         */
        guard nums1.count <= nums2.count else {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        let x = nums1.count // 短
        let y = nums2.count // 长
        
        var low = 0
        var high = x
        
        while low <= high {
            let px = (low + high) / 2 // A的中线位置
            let py = (x + y + 1) / 2 - px // B的中线位置 起始位 总长度的一半
            
            let maxLeftX = px == 0 ? Int.min : nums1[px - 1]
            let minRightX = px == x ? Int.max : nums1[px]
            
            let maxLeftY = py == 0 ? Int.min : nums2[py - 1]
            let minRightY = py == y ? Int.max : nums2[py]
            
            if maxLeftX <= minRightY && minRightX >= maxLeftY  { //找到了
                if ((x + y) % 2) == 0 {
                    let v1 = Double(max(maxLeftX, maxLeftY))
                    let v2 = Double(min(minRightX, minRightY))
                    return (v1 + v2) / 2
                } else {
                    return Double(max(maxLeftX, maxLeftY))
                }
            } else if (maxLeftX > minRightY) {
                high = px - 1
            } else {
              low = px + 1
            }
        }
        
        return Double(-1.0)
    }
    
    //方法二： 直接有序数组合并，然后 去中位数  O(n2) O(m+n)
    func findMedianSortedArrays_1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count > 0 && nums2.count > 0 else {
            let nums3 = nums1.count > nums2.count ? nums1 : nums2
            return caculateRes(nums3)
        }

        var nums3 = Array(repeating: 0, count: nums1.count + nums2.count)
        mergToArray(nums1, nums2, &nums3)
        return caculateRes(nums3)
    }
    
    private func caculateRes(_ nums3: [Int]) -> Double {
        var res = 0.0
        let i: Int = nums3.count / 2
        if nums3.count % 2 == 0 {
            res = (Double(nums3[i]) + Double(nums3[i - 1])) / 2
        } else {
            res = Double(nums3[i])
        }
        return res
    }
    
    private func mergToArray(_ nums1: [Int], _ nums2: [Int], _ nums3:inout [Int]) -> Void {
        var la = nums1.count - 1
        var lb = nums2.count - 1
        var lc = nums1.count + nums2.count - 1
        
        while la >= 0 && lb >= 0 {
            if nums1[la] >= nums2[lb] {
                nums3[lc] = nums1[la]
                la -= 1
                lc -= 1
            }else {
                nums3[lc] = nums2[lb]
                lb -= 1
                lc -= 1
            }
        }
        
        let lev = la >= 0 ? nums1 : nums2
        var lef = la >= 0 ? la : lb
        while lef >= 0 {
            nums3[lef] = lev[lef];
            lef -= 1
        }
    }
}
