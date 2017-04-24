//
//  MergeSort.swift
//  merge-sort
//
//  Created by Vadim Dez on 24.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

class MergeSort {
    static func sort(array: [Int]) -> [Int] {
        let arrayLength = array.count;
        
        if (arrayLength <= 1) {
            return array;
        }
        
        let middle: Int = arrayLength / 2;
        
        return self.merge(
            leftArray: self.sort(array: Array(array[0..<middle])),
            rightArray: self.sort(array: Array(array[middle..<arrayLength]))
        );
    }
    
    static func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
        let leftArrayLength = leftArray.count;
        let rightArrayLength = rightArray.count;
        var leftIndex = 0;
        var rightIndex = 0;
        var resultArray: [Int] = [];
        
        
        while leftIndex < leftArrayLength && rightIndex < rightArrayLength {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                resultArray.append(leftArray[leftIndex]);
                leftIndex += 1;
            } else {
                resultArray.append(rightArray[rightIndex]);
                rightIndex += 1;
            }
        }
        
        for index in leftIndex..<leftArrayLength {
            resultArray.append(leftArray[index]);
        }
        
        for index in rightIndex..<rightArrayLength {
            resultArray.append(rightArray[index]);
        }
        
        return resultArray;
    }
}
