//: [Previous](@previous)

import UIKit

var array = [1,2,4,2,5,6]

func calculate(arr: [Int])-> [Int] {
    
    var totalStick: [Int] = []
//    var min: Int = arr.min()
//    var new: [Int] = []
//
//    for i in arr {
//        if i != 0 {
//            new.append(i-min)
//        }
//        new.remove(at: arr[i])
//    }
//
//    new.count = arr.count
    totalStick.append(arr.count)

    return totalStick
}

print(calculate(array))

