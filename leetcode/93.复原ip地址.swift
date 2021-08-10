/*
 * @lc app=leetcode.cn id=93 lang=swift
 *
 * [93] 复原IP地址
 *
 * https://leetcode-cn.com/problems/restore-ip-addresses/description/
 *
 * algorithms
 * Medium (46.80%)
 * Likes:    348
 * Dislikes: 0
 * Total Accepted:    63.2K
 * Total Submissions: 131.8K
 * Testcase Example:  '"25525511135"'
 *
 * 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
 * 
 * 有效的 IP 地址正好由四个整数（每个整数位于 0 到 255 之间组成），整数之间用 '.' 分隔。
 * 
 * 
 * 
 * 示例:
 * 
 * 输入: "25525511135"
 * 输出: ["255.255.11.135", "255.255.111.35"]
 * 
 */

// @lc code=start
class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count >= 4 && s.count <= 12 else {
            return []
        }
        let arr = [Character](s)
        var res = [String]()
        backtrack(&res, "", arr, 0, 4)
        return res 
    }

    private func backtrack(_ res: inout [String], _ item: String, _ arr: [Character], _ start: 
    Int, _ backFlag: Int) {
        if start == arr.count && backFlag == 0 {
            let endIndex = item.index(item.startIndex, offsetBy:item.count - 1)
            res.append(String(item[item.startIndex ..< endIndex]))
            return 
        }
        if backFlag < 0 {
            return
        }
        for j in start ..< start + 3 {
            if j < arr.count {
                if j == start && arr[j] == "0" {
                    backtrack(&res, item + "\(arr[j]).", arr, j + 1, backFlag - 1)
                    return
                } else {
                    let t = String(arr[start ..< j + 1])
                    if let r = Int(t), r <= 255 {
                        backtrack(&res, item + "\(t).", arr, j + 1, backFlag - 1)
                    }
                }
            }
        }
    }
}
// @lc code=end

