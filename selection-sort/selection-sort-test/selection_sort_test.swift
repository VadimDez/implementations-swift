//
//  selection_sort_test.swift
//  selection-sort-test
//
//  Created by Vadim Dez on 24.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import XCTest

class selection_sort_test: XCTestCase {
    
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
    
    func testSelectionSort() -> Void {
        XCTAssertEqual(SelectionSort.sort(array: [1]), [1]);
        
        XCTAssertEqual(SelectionSort.sort(array: [1, 2]), [1, 2]);
        
        XCTAssertEqual(SelectionSort.sort(array: [3, 1, 2]), [1, 2, 3]);
        
        XCTAssertEqual(SelectionSort.sort(array: [3, 1, 4, 2]), [1, 2, 3, 4]);
        
        XCTAssertEqual(SelectionSort.sort(array: [-2, 5, 2, 7, 4,23, 6, 2, -6]), [-6, -2, 2, 2, 4, 5, 6, 7, 23]);
    }
}
