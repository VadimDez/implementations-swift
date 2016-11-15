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

