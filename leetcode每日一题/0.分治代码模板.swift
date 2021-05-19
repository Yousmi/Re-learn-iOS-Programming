//
//  0.分治代码模板.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/18.
//  Copyright © 2020 钱志新. All rights reserved.
//

func divide_conquer(_ problem: AnyObject?) -> Int {
    if problem == nil {
        let res = process_result(0, 0)
        return res
    }
    
    let subProblems = split_problem(problem)
    let res1 = divide_conquer(subProblems?.first)
    let res2 = divide_conquer(subProblems?.last)
    
    let res = process_result(res1, res2)
    return res
}

func split_problem(_ problem: AnyObject?) -> [AnyObject]? {
    return []
}

func process_result(_ res1: Int, _ res2: Int) -> Int {
    return res1 + res2
}
