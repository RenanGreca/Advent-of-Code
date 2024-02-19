//
//  1.swift
//  AdventOfCode2020
//
//  Created by Renan Greca on 01/12/20.
//

import Foundation

//print("Hello World")
//reportRepair()

public func reportRepair(arr: [Int]) -> Int {
//    let arr = [1721, 979, 366, 299, 675, 1456].sorted()
    let arr = arr.sorted()
    
    for i in 0..<arr.count {
        let a = arr[i]
        
        var j = arr.count-1
        var b = arr[j]
        while a+b > 2020 {
            j -= 1
            b = arr[j]
        }
        
        if a+b == 2020 {
            return a*b
        }
    }
    
    return 0;
}

public func reportRepair2(arr: [Int]) -> Int {
//    let arr = [1721, 979, 366, 299, 675, 1456]//.sorted()
//    let arr = getArrayFromFile()//.sorted()
    
    for i in 0..<arr.count-2 {
        let a = arr[i]
        for j in i+1..<arr.count-1 {
            let b = arr[j]
            if a+b <= 2020 {
                for k in j+1..<arr.count {
                    let c = arr[k]
                    if a+b+c == 2020 {
                        return a*b*c
                    }
                }
            }
        }
    }
    
    return 0;
}

public func processInput1()  -> [Int] {
    if let filepath = Bundle.main.path(forResource: "input1", ofType: "txt") {
        // Read all the data
        do {
            let contents = try String(contentsOfFile: filepath)
            
            let arr = contents.components(separatedBy: "\n")
            return arr.compactMap { Int($0) }
        } catch {
        }
    }
    
    return []
}
