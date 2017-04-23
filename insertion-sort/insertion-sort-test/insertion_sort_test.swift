//
//  insertion_sort_test.swift
//  insertion-sort-test
//
//  Created by Vadim Dez on 23.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import XCTest

class insertion_sort_test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testInsertionSort() {
        XCTAssertEqual(InsertionSort.sort(array: [1]), [1])
        
        XCTAssertEqual(InsertionSort.sort(array: [2, 1]), [1, 2])
        
        XCTAssertEqual(InsertionSort.sort(array: [2, 1, 3]), [1, 2, 3])
        
        XCTAssertEqual(InsertionSort.sort(array: [6, 32, 1, 6, 3, -6, 0, 11, 1]), [-6, 0, 1, 1, 3, 6, 6, 11, 32])
    }
}
