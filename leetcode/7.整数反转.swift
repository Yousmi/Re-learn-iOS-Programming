/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        var res = 0, input = x
        while input != 0 {
            let carray = input % 10 // 余数
            if (res > Int32.max / 10) || (res == Int32.max / 10 && carray > Int(Int32.max) - res * 10) {
                return 0
            }
            if (res < Int32.min / 10) || (res == Int32.min / 10 && carray < Int(Int32.min) - res * 10) {
                return 0
            }
            res = res * 10 + carray
            input = input / 10
        }
        return res
    }

    func reverse_1(_ x: Int) -> Int {

        // 思路

        // 标签：数学
        // 本题如果不考虑溢出问题，是非常简单的。解决溢出问题有两个思路，第一个思路是通过字符串转换加try catch的方式来解决，第二个思路就是通过数学计算来解决。
        // 由于字符串转换的效率较低且使用较多库函数，所以解题方案不考虑该方法，而是通过数学计算来解决。
        // 通过循环将数字x的每一位拆开，在计算新值时每一步都判断是否溢出。
        // 溢出条件有两个，一个是大于整数最大值MAX_VALUE，另一个是小于整数最小值MIN_VALUE，设当前计算结果为ans，下一位为pop。
        // 从ans * 10 + pop > MAX_VALUE这个溢出条件来看
        // 当出现 ans > MAX_VALUE / 10 且 还有pop需要添加 时，则一定溢出
        // 当出现 ans == MAX_VALUE / 10 且 pop > 7 时，则一定溢出，7是2^31 - 1的个位数
        // 从ans * 10 + pop < MIN_VALUE这个溢出条件来看
        // 当出现 ans < MIN_VALUE / 10 且 还有pop需要添加 时，则一定溢出
        // 当出现 ans == MIN_VALUE / 10 且 pop < -8 时，则一定溢出，8是-2^31的个位数
        var input = x
        var ans = 0
        while input != 0 {
            let pop = input % 10
            if ((ans > Int32.max / 10) || (ans == Int32.max / 10 && pop > 7))  {
                return 0
            }
            
            if ((ans < Int32.min / 10) || (ans == Int32.min / 10 && pop < -8)) {
                return 0
            }
            
            ans = ans * 10 + pop
            input = input / 10
        }
        return ans
    }

    func reverse_2(_ x: Int) -> Int {
        var res = 0
        var op = x
        while op != 0 {
            let pop = op % 10
            res = res * 10 + pop
            op = op / 10

            if res > Int32.max || res < Int32.min {
                return 0
            }
        }
        return res
    }
    
}
// @lc code=end

