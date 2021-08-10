/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个正序数组的中位数
 */

// @lc code=start
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count <= nums2.count else {
            return findMedianSortedArrays(nums2, nums1)
        }
        var low = 0, height = nums1.count
        while low <= height {
            let mid_1 = (low + height) / 2 // 处理到 nums1 的中线
            let mid_2 = (nums1.count + nums2.count + 1) / 2 - mid_1

            let maxLeftA = mid_1 == 0 ? Int.min : nums1[mid_1 - 1]
            let minRightA = mid_1 == nums1.count ? Int.max : nums1[mid_1]

            let maxLeftB =  mid_2 == 0 ? Int.min : nums2[mid_2 - 1]
            let minRightB =  mid_2 == nums2.count ? Int.max : nums2[mid_2]
            if maxLeftA <= minRightB && minRightA >= maxLeftB {
                if ((nums1.count + nums2.count) % 2) == 0 {
                    let res1 = Double(max(maxLeftA, maxLeftB))
                    let res2 = Double(min(minRightA, minRightB))
                    return (res1 + res2) / 2
                } else {
                    return Double(max(maxLeftA, maxLeftB))
                }
            } else if (maxLeftA > minRightB) {
                height = mid_1 - 1
            } else {
                low = mid_1 + 1
            }
        }
        return Double(-1)
    }
    func findMedianSortedArrays_1(_ nums1: [Int], _ nums2: [Int]) -> Double {
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
    /*
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        guard nums1.count > 0 && nums2.count > 0 else {
            let nums3 = nums1.count > nums2.count ? nums1 : nums2
            return caculateRes(nums3)
        }
        var nums3 = Array.init(repeating: 0, count: nums1.count + nums2.count)
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
    */
}
// @lc code=end

