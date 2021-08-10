/*
 * @lc app=leetcode.cn id=50 lang=swift
 *
 * [50] Pow(x, n)
 */

// @lc code=start
class Solution {
    //分治思想
    //划分一半
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n < 0 {
            return myPow(1.0 / x , -n)
        }
        //terminator
        if x == 0.0 {
            return 0.0 
        }
        if n == 0 {
            return 1.0
        }
        if n == 1 {
            return x
        }
        //process current level
        var state = 1.0
        if n % 2 == 1 {
            state = x
        }
        //drill down
        let half = myPow(x, n / 2)

        return half * half * state
        //restore states
    }
}
// @lc code=end

