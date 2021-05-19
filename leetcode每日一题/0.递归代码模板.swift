//
//  0.递归代码模板.swift
//  INTERVIEW
//
//  Created by Scan on 2020/8/18.
//  Copyright © 2020 钱志新. All rights reserved.
//

func recursion(_ level: Int, _ target: Int, _ param: Int) {
    //1. terminator
    if  level > target {
        //process result
        return
    }
    //2. process current logic
    //process(level, target, param)
    //3. drill dowm
    recursion(level + 1, target, param)
    
    //4.reverse current status if needed
}

