//
//  InsertionSort.swift
//  insertion-sort
//
//  Created by Vadim Dez on 23.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

class InsertionSort {
    static func sort(array: [Int]) -> [Int] {
        let n = array.count - 1;
        var array = array;
        
        for i in 0..<n {
            var prev = i;
            var next = prev + 1;
            
            while prev >= 0 && array[prev] > array[next] {
                let tmp = array[next];
                array[next] = array[prev];
                array[prev] = tmp;
                
                prev -= 1;
                next -= 1;
            }
        }
        
        return array;
    }
}
