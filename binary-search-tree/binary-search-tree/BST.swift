//
//  BST.swift
//  binary-search-tree
//
//  Created by Vadim Dez on 04/01/2017.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

enum BSTError: Error {
    case EmptyTree
}

class BST {
    var root: Node?
    
    func insert(value: Int) -> Void {
        let node = Node(value: value)
        
        self.root = self.insertNode(root: self.root, node: node)
    }
    
    private func insertNode(root: Node?, node: Node) -> Node {
        if root == nil {
            return node;
        }
        
        if node.value >= (root?.value)! {
            root?.right = self.insertNode(root: root?.right, node: node)
        } else {
            root?.left = self.insertNode(root: root?.left, node: node)
        }
        
        return root!
    }
    
    func getNodeCount() -> Int {
        return self.getNodeCount(root: self.root)
    }
    
    private func getNodeCount(root: Node?) -> Int {
        if root == nil {
            return 0
        }
        
        return 1 + self.getNodeCount(root: root!.left) + self.getNodeCount(root: root!.right)
    }
    
    func printValues() -> String {
        return self.printValues(root: self.root)
    }
    
    private func printValues(root: Node?) -> String {
        var str: String = ""
        
        if root == nil {
            return str
        }
        
        let left: String = self.printValues(root: root!.left)
        let right: String = self.printValues(root: root!.right)
        
        if left != "" {
            str = "\( left ) "
        }
        
        str += "\( root!.value )"
        
        if right != "" {
            str += " \( right )"
        }
        
        return str
    }
    
    func deleteTree() -> Void {
        self.root = nil
    }
    
    func isInTree(value: Int) -> Bool {
        return self.isInTree(node: self.root, value: value)
    }
    
    private func isInTree(node: Node?, value: Int) -> Bool {
        if node == nil {
            return false
        }
        
        if value == node?.value {
            return true
        }
        
        if value > node!.value {
            return self.isInTree(node: node?.right, value: value)
        }
        
        return self.isInTree(node: node?.left, value: value)
    }
    
    func getMin() throws -> Int {
        if self.root == nil {
            throw BSTError.EmptyTree
        }
        
        return self.getMin(node: self.root!)
    }
    
    private func getMin(node: Node) -> Int {
        if node.left == nil {
            return node.value
        }
        
        return self.getMin(node: node.left!)
    }
    
    func getMax() throws -> Int {
        if self.root == nil {
            throw BSTError.EmptyTree
        }
        
        return self.getMax(node: self.root!)
    }
    
    private func getMax(node: Node) -> Int {
        if node.right == nil {
            return node.value
        }
        
        return self.getMax(node: node.right!)
    }
}
