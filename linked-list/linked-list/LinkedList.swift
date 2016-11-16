//
//  LinkedList.swift
//  linked-list
//
//  Created by Vadim Dez on 14/11/2016.
//  Copyright © 2016 Vadim Dez. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

enum LinkedListError: Error {
    case IndexOutOfBounds
    case Empty
}

class LinkedList {
    private var head: Node?
    private var tail: Node?
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
        let node = Node(value: value, next: nil)
        
        if (!self.empty()) {
            node.next = self.head
        } else {
            self.tail = node
        }
        
        self.head = node
        
        self.count += 1
    }
    
    // get value at index
    func valueAt(index: Int) throws -> Int {
        if index < 0 || index > self.size() - 1 {
            throw LinkedListError.IndexOutOfBounds
        }
        
        if self.empty() {
            throw LinkedListError.Empty
        }
        
        var node = self.head
        
        for _ in 0..<index {
            node = node?.next
        }
        
        return node!.value
    }
    
    func popFront() throws -> Int {
        if self.empty() {
            throw LinkedListError.Empty
        }
        
        let value = self.head?.value
        
        self.head = self.head?.next
        
        self.count -= 1
        
        return value!
    }
    
    func pushBack(value: Int) {
        self.tail?.next = Node(value: value, next: nil)
        self.tail = self.tail?.next
        
        self.count += 1
    }
    
    func popBack() throws -> Int {
        if self.empty() {
            throw LinkedListError.Empty
        }
        
        let value = self.tail?.value
        var node = self.head
        
        self.count -= 1
        
        for _ in 0..<self.count - 1 {
            node = node?.next
        }
        
        self.tail = node
        
        return value!
    }
    
    func front() throws -> Int {
        if self.empty() {
            throw LinkedListError.Empty
        }
        
        return (self.head?.value)!
    }
    
    func back() throws -> Int {
        if self.empty() {
            throw LinkedListError.Empty
        }
        
        return (self.tail?.value)!
    }
    
    func insert(index: Int, value: Int) {
        var node = self.head
        
        if index == 0 {
            self.head = Node(value: value, next: self.head?.next)
        } else {
        
            for _ in 0..<index-1 {
                node = node?.next
            }
        
            node?.next = Node(value: value, next: node?.next)
        }
        
        if self.tail?.next != nil {
            self.tail = self.tail?.next
        }
        
        self.count += 1
    }
    
    func erase(index: Int) throws {
        if index < 0 || index > self.size() - 1 {
            throw LinkedListError.IndexOutOfBounds
        }
        
        var node = self.head
        
        if index == 0 {
            self.head = self.head?.next
        } else {
            for _ in 0..<index-1 {
                node = node?.next
            }
            node?.next = node?.next?.next
        }
        
        
        if index + 1 == self.count {
            self.tail = node
        }
        
        self.count -= 1
    }
    
    func value_n_from_end(n: Int) throws -> Int {
        if n < 0 || n > self.size() {
            throw LinkedListError.IndexOutOfBounds
            
        }
        var node = self.head
        
        for _ in 0..<self.size() - n {
            node = node?.next
        }
        
        return (node?.value)!
    }
}
