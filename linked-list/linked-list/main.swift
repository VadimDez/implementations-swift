//
//  main.swift
//  linked-list
//
//  Created by Vadim Dez on 14/11/2016.
//  Copyright © 2016 Vadim Dez. All rights reserved.
//

import Foundation

print("Linked list")

var l = LinkedList()

print("List size: \( l.size() )\n")

l.pushFront(value: 101)
l.pushFront(value: 100)

print("List empty: \( l.empty() )\n")


print("Value at index 0: \( try? l.valueAt(index: 0) ) )\n")
print("Value at index 1: \( try? l.valueAt(index: 1) ) )\n")

l.pushBack(value: 102)
print("Value at index 2: \( try? l.valueAt(index: 2) ) )\n")

print("pop back: \( try? l.popBack() ) )\n")
print("List size: \( l.size() )\n")

print("pop front: \( try? l.popFront() ) )\n")
print("List size: \( l.size() )\n")
print("Value at index 0: \( try? l.valueAt(index: 0) ) )\n")


print("Value at front(): \( try? l.front() ) )\n")
print("Value at back(): \( try? l.back() ) )\n")

print("Insert")
l.insert(index: 0, value: 0)
l.insert(index: 2, value: 3)
print("Value at index 0: \( try? l.valueAt(index: 0) ) )\n")
print("Value at index 1: \( try? l.valueAt(index: 1) ) )\n")
print("Value at index 2: \( try? l.valueAt(index: 2) ) )\n")


print("Rrase")
try l.erase(index: 1)

print("Value at index 0: \( try? l.valueAt(index: 0) ) )\n")
print("Value at index 1: \( try? l.valueAt(index: 1) ) )\n")


try l.erase(index: 0)
print("Value at index 0: \( try? l.valueAt(index: 0) ) )\n")
print("Value at index 1: \( try? l.valueAt(index: 1) ) )\n")
print("Value at front(): \( try? l.front() ) )\n")
print("Value at back(): \( try? l.back() ) )\n")


print("Value n fron end")
print("Value n=1 from end: \( try? l.value_n_from_end(n: 1) ) )\n")
