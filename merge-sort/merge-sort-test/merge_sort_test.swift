//
//  merge_sort_test.swift
//  merge-sort-test
//
//  Created by Vadim Dez on 24.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import XCTest

class merge_sort_test: XCTestCase {
    
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
    
    func testMergeSort() {
        XCTAssertEqual(MergeSort.sort(array: [1]), [1])
        
        XCTAssertEqual(MergeSort.sort(array: [2, 1]), [1, 2])
        
        XCTAssertEqual(MergeSort.sort(array: [2, 1, 3]), [1, 2, 3])
        
        XCTAssertEqual(MergeSort.sort(array: [2, 1, 2, 3]), [1, 2, 2, 3])
        
        XCTAssertEqual(MergeSort.sort(array: [-1, 6, 23, 512, -22, 5, 0 ,2 ,5, 7, 4, 3]), [-22, -1, 0, 2, 3, 4, 5, 5, 6, 7, 23, 512])
    }
    
    func testMergeFunction() -> Void {
        XCTAssertEqual(MergeSort.merge(leftArray: [2], rightArray: [1]), [1, 2]);
        
        XCTAssertEqual(MergeSort.merge(leftArray: [1], rightArray: [2]), [1, 2]);
        
        XCTAssertEqual(MergeSort.merge(leftArray: [1, 2], rightArray: [2, 3]), [1, 2, 2, 3]);
        
        XCTAssertEqual(MergeSort.merge(leftArray: [1, 2, 5], rightArray: [2, 6]), [1, 2, 2, 5, 6]);
        
        XCTAssertEqual(MergeSort.merge(leftArray: [2, 6], rightArray: [1, 2, 5]), [1, 2, 2, 5, 6]);
    }
}
