//
//  LinkedList.swift
//  linked-list
//
//  Created by Vadim Dez on 14/11/2016.
//  Copyright © 2016 Vadim Dez. All rights reserved.
//

import Foundation

struct Node {
    var value: Int
    var next: UnsafeMutablePointer<Node>?
}

enum LinkedListError: Error {
    case IndexOutOfBounds
}

class LinkedList {
    private var head: UnsafeMutablePointer<Node>? = UnsafeMutablePointer<Node>.allocate(capacity: 1)
    private var tail: UnsafeMutablePointer<Node>? = UnsafeMutablePointer<Node>.allocate(capacity: 1)
    private var count: Int = 0
    
    init() {
    }
    
    // get size
    func size() -> Int {
        return self.count;
    }
    
    // check if epmty
    func empty() -> Bool {
        return self.count == 0;
    }
    
    // put value to the head
    func pushFront(value: Int) {
        var node = Node(value: value, next: nil)
        
        if (!self.empty()) {
            node.next = UnsafeMutablePointer<Node>.allocate(capacity: 1)
            node.next = self.head
        }
        
        self.head?[0] = node
        
        self.count += 1
    }
    
    // get value at index
    func valueAt(index: Int) throws -> Int {
        var node: UnsafeMutablePointer<Node>? = UnsafeMutablePointer<Node>.allocate(capacity: 1)
        node = self.head
        
        if index < 0 || index > self.size() - 1 {
            throw LinkedListError.IndexOutOfBounds
        }
        
        for _ in 0..<index {
            
        }
        
        return (node?.pointee.value)!
    }
}
