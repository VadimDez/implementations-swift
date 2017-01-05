//
//  BST.swift
//  binary-search-tree
//
//  Created by Vadim Dez on 04/01/2017.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

class BST {
    var root: Node?
    
    func insert(value: Int) -> Void {
        var i = self.root
        
        while i != nil {
            i = i?.right
        }
        
        i = Node(value: value)
    }
}
