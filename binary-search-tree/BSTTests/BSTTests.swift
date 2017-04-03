//
//  BSTTests.swift
//  BSTTests
//
//  Created by Vadim Dez on 22/01/2017.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import XCTest
@testable import BinarySearchTree

class BSTTests: XCTestCase {
    var tree: BST?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.tree = BST()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNotNil() -> Void {
        XCTAssertNotNil(self.tree)
    }
    
    func testInsert() -> Void {
        let value = 1;
        self.tree?.insert(value: value);
        
        XCTAssertEqual(self.tree?.root?.value, value)
    }
    
    func testInsertMultiple() -> Void {
        self.tree?.insert(value: 10);
        self.tree?.insert(value: 20);
        self.tree?.insert(value: 25);
        self.tree?.insert(value: 24);
        self.tree?.insert(value: 5);
        self.tree?.insert(value: 7);
        self.tree?.insert(value: 9);
        
        XCTAssertEqual(self.tree?.root?.value, 10)
        XCTAssertEqual(self.tree?.root?.right?.value, 20)
        XCTAssertEqual(self.tree?.root?.right?.right?.value, 25)
        XCTAssertEqual(self.tree?.root?.right?.right?.left?.value, 24)
        XCTAssertEqual(self.tree?.root?.left?.value, 5)
        XCTAssertEqual(self.tree?.root?.left?.right?.value, 7)
        XCTAssertEqual(self.tree?.root?.left?.right?.right?.value, 9)
    }
    
    func testInsertToTheLeft() -> Void {
        let rootValue = 100
        let leftValue = 80
        self.tree?.insert(value: rootValue)
        self.tree?.insert(value: leftValue)
        
        XCTAssertEqual(self.tree?.root?.value, rootValue)
        XCTAssertEqual(self.tree?.root?.left?.value, leftValue)
    }
    
    func testInsertToTheRight() -> Void {
        let rootValue = 80
        let rightValue = 100
        
        self.tree?.insert(value: rootValue)
        self.tree?.insert(value: rightValue)
        
        XCTAssertEqual(self.tree?.root?.value, rootValue)
        XCTAssertEqual(self.tree?.root?.right?.value, rightValue)
    }
    
    func testInsertTwiceToTheRight() -> Void {
        let rootValue = 80
        let rightValue = 100
        
        self.tree?.insert(value: rootValue)
        self.tree?.insert(value: rightValue)
        self.tree?.insert(value: rightValue)
        
        XCTAssertEqual(self.tree?.root?.value, rootValue)
        XCTAssertEqual(self.tree?.root?.right?.value, rightValue)
        XCTAssertEqual(self.tree?.root?.right?.right?.value, rightValue)
    }
    
    func testGetNodeCountOfEmptyTree() -> Void {
        XCTAssertEqual(0, self.tree?.getNodeCount())
    }
    
    func testGetNodeCount() -> Void {
        XCTAssertEqual(0, self.tree?.getNodeCount())

        self.tree?.insert(value: 100)
        XCTAssertEqual(1, self.tree?.getNodeCount())

        self.tree?.insert(value: 110)
        XCTAssertEqual(2, self.tree?.getNodeCount())
        
        self.tree?.insert(value: 90)
        XCTAssertEqual(3, self.tree?.getNodeCount())
        
        self.tree?.insert(value: 120)
        self.tree?.insert(value: 130)
        self.tree?.insert(value: 50)
        self.tree?.insert(value: 600)
        XCTAssertEqual(7, self.tree?.getNodeCount())
    }
    
    func testPrintValues() -> Void {
        XCTAssertEqual("", self.tree?.printValues())
        
        self.tree?.insert(value: 10)
        XCTAssertEqual("10", self.tree?.printValues())
        
        self.tree?.insert(value: 11)
        self.tree?.insert(value: 9)
        self.tree?.insert(value: 8)
        self.tree?.insert(value: 15)
        let str = self.tree?.printValues()
        
        XCTAssertEqual("8 9 10 11 15", str)
    }
    
    func testDeleteTree() -> Void {
        self.tree?.deleteTree()
        
        XCTAssertNil(self.tree?.root)
    }
    
    func testEmptyIsInTree() -> Void {
        XCTAssertFalse(self.tree!.isInTree(value: 8))
    }
    
    func testIsInTree() -> Void {
        self.tree?.insert(value: 8)
        XCTAssertTrue(self.tree!.isInTree(value: 8))
        
        self.tree?.insert(value: 5)
        self.tree?.insert(value: 100)
        self.tree?.insert(value: 20)
        self.tree?.insert(value: 25)
        self.tree?.insert(value: 3)
        self.tree?.insert(value: 12)
        self.tree?.insert(value: 0)
        self.tree?.insert(value: -100)
        XCTAssertTrue(self.tree!.isInTree(value: 20))
        XCTAssertFalse(self.tree!.isInTree(value: 21))
    }
    
    func testGetMin() -> Void {
        self.tree?.insert(value: 10)
        self.tree?.insert(value: 12)
        self.tree?.insert(value: 8)
        self.tree?.insert(value: 1)
        self.tree?.insert(value: 6)
        
        XCTAssertEqual(try! self.tree?.getMin(), 1)
        
        self.tree?.insert(value: -10)
        XCTAssertEqual(try! self.tree?.getMin(), -10)
    }
    
    func testGetMax() -> Void {
        
        self.tree?.insert(value: 10)
        self.tree?.insert(value: 12)
        self.tree?.insert(value: 8)
        self.tree?.insert(value: 1)
        self.tree?.insert(value: 6)
        
        XCTAssertEqual(try! self.tree?.getMax(), 12)
        
        self.tree?.insert(value: 20)
        self.tree?.insert(value: 19)
        self.tree?.insert(value: 18)
        XCTAssertEqual(try! self.tree?.getMax(), 20)
    }
    
    func testGetHeightOfEmptyTree() -> Void {
        XCTAssertEqual(self.tree?.getHeight(), 0)
    }
    
    func testGetHeight() -> Void {
        self.tree?.insert(value: 1)
        XCTAssertEqual(self.tree?.getHeight(), 1)
        
        self.tree?.insert(value: 2)
        self.tree?.insert(value: -10)
        self.tree?.insert(value: 100)
        self.tree?.insert(value: 35)
        self.tree?.insert(value: 6)
        self.tree?.insert(value: -1)
        
        XCTAssertEqual(self.tree?.getHeight(), 5)
    }
    
    func testIsBinarySearchTreeEmptyTree() {
        XCTAssertTrue(self.tree!.isBinarySearchTree())
    }
    
    func testIsBinarySearchTree() {
        self.tree?.insert(value: 100)
        self.tree?.insert(value: 101)
        XCTAssertTrue(self.tree!.isBinarySearchTree())
    }
    
    func testGetSuccessorOfEmptyTree() -> Void {
        XCTAssertEqual(self.tree?.getSuccessor(value: 100), -1)
    }
    
    func testGetSuccessor() -> Void {
        self.tree?.insert(value: 101)
        self.tree?.insert(value: 100)
        XCTAssertEqual(self.tree?.getSuccessor(value: 100), 101)
        self.tree?.insert(value: 102)
        
        XCTAssertEqual(self.tree?.getSuccessor(value: 101), 102)
        
        self.tree?.insert(value: 110)
        self.tree?.insert(value: 104)
        self.tree?.insert(value: 105)
        XCTAssertEqual(self.tree?.getSuccessor(value: 105), 110)
    }
    
    func testDeleteValue() -> Void {
        self.tree?.insert(value: 100)
        self.tree?.insert(value: 101)
        self.tree?.deleteValue(value: 101)
        XCTAssertEqual(self.tree?.isInTree(value: 101), false)
    }
    
    
    func testLeftDeleteValue() -> Void {
        self.tree?.insert(value: 100)
        self.tree?.insert(value: 101)
        self.tree?.insert(value: 99)
        self.tree?.deleteValue(value: 99)
        XCTAssertEqual(self.tree?.isInTree(value: 99), false)
    }
    
    func testNestedDeleteValue() -> Void {
        self.tree?.insert(value: 100)
        self.tree?.insert(value: 101)
        self.tree?.insert(value: 98)
        self.tree?.insert(value: 99)
        self.tree?.deleteValue(value: 99)
        XCTAssertEqual(self.tree?.isInTree(value: 99), false)
    }
    
    
    func testDeleteParent() -> Void {
        self.tree?.insert(value: 100)
        self.tree?.insert(value: 101)
        self.tree?.deleteValue(value: 100)
        XCTAssertEqual(self.tree?.isInTree(value: 100), false)
    }
}
