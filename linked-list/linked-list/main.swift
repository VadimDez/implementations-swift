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

print("List size: \( l.size() )")

l.pushFront(value: 100)

print("List empty: \( l.empty() )")


print("Value at index 0: \( try? l.valueAt(index: 0) ) )")
