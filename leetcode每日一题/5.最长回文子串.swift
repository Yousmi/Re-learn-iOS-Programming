/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class Solution_5 {
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }

        let arr = Array(s)
        var len = 1, idx = 0
        var dp = [[Bool]](repeating:[Bool](repeating:false,count:arr.count),count:arr.count)
        for i in 0 ..< arr.count {
            dp[i][i] = true
        }
        for r in 1 ..< arr.count {//这个是尾部
            for c in 0 ..< r { //这个是头部
                if arr[r] != arr[c] {
                    dp[c][r] = false
                } else {
                    if r - c < 3 {
                        dp[c][r] = true
                    } else {
                        dp[c][r] = dp[c + 1][r - 1]
                    }
                }
                if dp[c][r] && r - c + 1 > len {
                    len = r - c + 1
                    idx = c
                }
            }
        }
        return String(arr[idx ... idx + len])
    }
    
    //动态规划解法
    func longestPalindrome_2(_ s: String) -> String {
        if s.count == 0 || s.count == 1 {
            return s
        }
        let charArray = [Character](s)
        var isPalindrome = [[Bool]](repeating: [Bool](repeating: false, count: charArray.count), count: charArray.count)
        for i in 0..<charArray.count {
            isPalindrome[i][i] = true
        }
        for i in 0..<charArray.count - 1 {
            if charArray[i] == charArray[i + 1] {
                isPalindrome[i][i + 1] = true
            }
        }
        var left = 0
        var right = 0
        for j in 1..<charArray.count {
            for i in 0..<j {
                if charArray[i] == charArray[j] && (isPalindrome[i + 1][j - 1] || j - i <= 2) {
                    isPalindrome[i][j] = true
                    if j - i > right - left {
                        left = i
                        right = j
                    }
                }
            }
        }
        return String(charArray[left...right])
    }
    
    //中间扩散解法
    func longestPalindrome_1(_ s: String) -> String {
        guard s.count > 0 else {
            return s
        }
        var start = 0, end = 0
        let ar: [Character] = Array(s);
        
        for i in 0..<s.count {
            let lenght = expand(ar, i, i);
            let lenght_2 = expand(ar, i, i+1)
            
            let len = max(lenght, lenght_2)
            if (len > end - start) {
                start = i - (len - 1) / 2;
                end = i + len / 2;
            }
        }
        return String(ar[start...end])
    }

    func expand(_ ar: [Character], _ left:Int, _ right: Int) -> Int {
        var begin = left, end = right;
        while begin >= 0 && end < ar.count && ar[begin] == ar[end] {
            begin -= 1
            end += 1
        }
        return end - begin - 1
    }
}
// @lc code=end

