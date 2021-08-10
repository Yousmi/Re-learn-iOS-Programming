/*
 * @lc app=leetcode.cn id=155 lang=swift
 *
 * [155] 最小栈
 */

// @lc code=start

class MinStack {
    private class StackItem {
        var data: Int = 0
        var min: Int = 0
        var next: StackItem?
        init(_ data: Int) {
            self.data = data
            self.min = data
        }
    }

    private var head: StackItem?
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        if let t = head {
            let n = StackItem(x)
            n.min = min(x, t.min)
            n.next = t
            head = n
        } else {
            head = StackItem(x)
        }
    }
    
    func pop() {
        head = head?.next
    }
    
    func top() -> Int {
        return head?.data ?? 0
    }
    
    func getMin() -> Int {
        return head?.min ?? 0
    }
}

class MinStack_1 {
    private lazy var stack: [Int] = {
        return [Int]()
    }()
    private lazy var minStack: [Int] = {
        return [Int]()
    }() //保存每个 push到 stack的值对应的 最小值
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        self.stack.append(x)
        if let mv = self.minStack.last {
            let minValue = min(mv, x)
            self.minStack.append(minValue)
        } else {
            self.minStack.append(x)
        }
    }
    
    func pop() {
        self.stack.popLast()
        self.minStack.popLast()
    }
    
    func top() -> Int {
        return self.stack.last ?? 0
    }
    
    func getMin() -> Int {
        return self.minStack.last ?? Int.min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
// @lc code=end

