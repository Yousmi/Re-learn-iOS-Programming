//
//  50.Pow(x, n).swift
//  INTERVIEW
//
//  Created by 钱志新 on 2020/7/28.
//  Copyright © 2020 钱志新. All rights reserved.
//

import Foundation

class Solution_50 {
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
