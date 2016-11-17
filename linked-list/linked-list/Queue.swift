//
//  Queue.swift
//  linked-list
//
//  Created by Vadim Dez on 17/11/2016.
//  Copyright © 2016 Vadim Dez. All rights reserved.
//

import Foundation

class Queue {
    private var list: LinkedList = LinkedList()
    
    func enqueue(value: Int) {
        self.list.pushBack(value: value)
    }
    
    func dequeue() -> Int {
        return try! self.list.popFront()
    }
    
    func empty() -> Bool {
        return self.list.empty()
    }
}
