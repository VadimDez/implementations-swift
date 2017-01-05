//
//  Node.swift
//  binary-search-tree
//
//  Created by Vadim Dez on 04/01/2017.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var right: Node?
    var left: Node?
    
    init(value: Int) {
        self.value = value
    }
}
