//
//  BubbleSort.swift
//  bubble-sort
//
//  Created by Vadim Dez on 23.04.17.
//  Copyright © 2017 Vadim Dez. All rights reserved.
//

import Foundation

class BubbleSort {
    
    static func sort(array: [Int]) -> [Int] {
        var array = array;
        let end = array.count - 1;
        
        for i in 0..<end {
            for j in 0..<end - i {
                let next = j + 1;
                
                if array[j] > array[next] {
                    let tmp = array[next];
                    array[next] = array[j];
                    array[j] = tmp;
                }
            }
        }
        
        return array;
    }
}
