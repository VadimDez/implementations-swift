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
        
        return self.getMin(node: self.root!).value
    }
    
    private func getMin(node: Node) -> Node {
        if node.left == nil {
            return node
        }
        
        return self.getMin(node: node.left!)
    }
    
    func getMax() throws -> Int {
        if self.root == nil {
            throw BSTError.EmptyTree
        }
        
        return self.getMax(node: self.root!).value
    }
    
    private func getMax(node: Node) -> Node {
        if node.right == nil {
            return node
        }
        
        return self.getMax(node: node.right!)
    }
    
    func getHeight() -> Int {
        return self.getMaxHeight(node: self.root)
    }
    
    private func getMaxHeight(node: Node?) -> Int {
        if node == nil {
            return 0
        }
     
        let leftHeight = self.getMaxHeight(node: node!.left)
        let rightHeight = self.getMaxHeight(node: node!.right)
        return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight)
    }
    
    func isBinarySearchTree() -> Bool {
        return self.isBinarySearchTree(node: self.root, minValue: Int(INT16_MIN), maxValue: Int(INT16_MAX))
    }
    
    private func isBinarySearchTree(node: Node?, minValue: Int, maxValue: Int) -> Bool {
        if node == nil {
            return true
        }
        
        return node!.value >= minValue
            && node!.value < maxValue
            && self.isBinarySearchTree(node: node!.left, minValue: minValue, maxValue: node!.value)
            && self.isBinarySearchTree(node: node!.right, minValue: node!.value, maxValue: maxValue)
        
    }
    
    private func find(value: Int, root: Node?) -> Node? {
        if root == nil {
            return nil;
        }
        
        if value < root!.value {
            return self.find(value: value, root: root!.left);
        }
        
        if value > root!.value {
            return self.find(value: value, root: root!.right);
        }
        
        return root;
    }
    
    func getSuccessor(value: Int) -> Int {
        let node = self.find(value: value, root: self.root)
        
        if node == nil {
            return -1
        }
        
        if node?.right != nil {
            return self.getMin(node: node!.right!).value
        }
        
        var successor: Node? = nil;
        var ancestor: Node? = self.root;
        
        while node?.value != ancestor?.value {
            if node!.value < ancestor!.value {
                successor = ancestor;
                ancestor = ancestor?.left;
            } else {
                ancestor = ancestor?.right;
            }
        }
        
        return successor!.value;
    }
    
    func deleteValue(value: Int) -> Void {
        let node = self.find(value: value, root: self.root)
        
        if node == nil {
            return;
        }
        
        self.root = self.deleteNode(root: self.root, nodeToDelete: node!)
    }
    
    private func deleteNode(root: Node?, nodeToDelete: Node) -> Node? {
        
        if root == nil {
            return nil
        }
        
        if (root?.value)! > nodeToDelete.value {
            root?.left = self.deleteNode(root: root?.left, nodeToDelete: nodeToDelete)
            return root
        }
        
        if (root?.value)! < nodeToDelete.value {
            root?.right = self.deleteNode(root: root?.right, nodeToDelete: nodeToDelete)
            return root
        }
        
        if root?.left == nil && root?.right == nil {
            return nil
        }
        
        if root?.left == nil {
            return root?.right
        }
        
        if root?.right == nil {
            return root?.left
        }
        
        let rightMinNode = self.getMin(node: root!.right!)
        
        rightMinNode.left = root?.left
        rightMinNode.right = self.deleteNode(root: root?.right, nodeToDelete: rightMinNode)
        
        return rightMinNode
    }
}
