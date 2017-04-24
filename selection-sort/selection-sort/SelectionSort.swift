//
//  SelectionSort.swift
//  selection-sort
//
//  Created by Vadim Dez on 24.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

class SelectionSort {
    static func sort(array: [Int]) -> [Int] {
        let arrayLength = array.count;
        var array = array;
        
        for i in 0..<arrayLength {
            var min = i;
            
            for j in i+1..<arrayLength {
                if array[min] > array[j] {
                    min = j;
                }
            }
            
            if i != min {
                let tmp = array[i];
                array[i] = array[min];
                array[min] = tmp;
            }
        }
        
        return array;
    }
}
