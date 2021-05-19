//
//  93. 复原IP地址.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/9.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_93 {
    func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count >= 4 && s.count <= 12 else {
            return []
        }
        let arr = Array(s)
        var res = [String]()
        backTrack(&res, "", 4, 0, arr.count, arr)
        return res
    }
    
    private func backTrack(_ res: inout [String], _ temp: String, _ flag: Int, _ left: Int, _ right: Int, _ arr: [Character]) {
        if left == right && flag == 0 {
            res.append(String(temp[temp.startIndex ..< temp.index(temp.startIndex, offsetBy: temp.count - 1)]))
            return
        }
        if flag < 0 {
            return
        }
        for j in left ..< left + 3 {
            if j < right {
                if j == left && arr[j] == "0" {
                    backTrack(&res, temp + "\(arr[j])" + ".", flag - 1, j + 1, right, arr)
                    return
                }
                let item = String(arr[left..<j + 1])
                if let r = Int(item), r <= 255 {
                    backTrack(&res, temp + item + ".", flag - 1, j + 1, right, arr)
                }
            }
        }
    }
}
