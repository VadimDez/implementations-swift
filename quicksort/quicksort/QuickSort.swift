//
//  QuickSort.swift
//  quicksort
//
//  Created by Vadim Dez on 25.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

class QuickSort {
    static func sort(array: [Int]) -> [Int] {
        let arrayLength = array.count;
        
        if arrayLength < 2 {
            return array;
        }
        
        let pivot = QuickSort.random(upperBound: arrayLength - 1);
        var array = array;
        
        QuickSort.partition(pivot: pivot, array: &array);
        
        return QuickSort.sort(array: Array(array[0..<pivot])) +
            [array[pivot]] +
            QuickSort.sort(array: Array(array[pivot+1..<arrayLength]));
    }
    
    static func random(upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)));
    }
    
    static func partition(pivot: Int, array: inout [Int]) -> Void {
        let arrayLength = array.count;
        var left = 0;
        var right = arrayLength - 1;
        
        while left != right && left <= right {
            
            if array[left] >= array[pivot] && array[right] <= array[pivot] {
                let tmp = array[right];
                array[right] = array[left];
                array[left] = tmp;
                left += 1;
                right -= 1;
            } else {
                if array[left] < array[pivot] {
                    left += 1;
                }
                
                if array[right] > array[pivot] {
                    right -= 1;
                }
            }
        }
    }
}
