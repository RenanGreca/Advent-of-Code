//
//  3.swift
//  AdventOfCode2020
//
//  Created by Renan Greca on 03/12/20.
//

import Foundation

//public func tobogganTrajectory(arr: [String]) -> Int {
//    var count:Int = 0
//
//    var offset = 3
//    for i in 1..<arr.count {
//        let line = arr[i]
//        count += (line[atOffset: (offset % line.count)] == "#") ? 1 : 0
//        offset += 3
//    }
//
//    return count
//}

public func tobogganTrajectory(arr: [String], right: Int, down: Int) -> Int {
    var count:Int = 0
    
    var j = right
    var i = down
    while i < arr.count {
        let line = arr[i]
        count += (line[atOffset: (j % line.count)] == "#") ? 1 : 0
        j += right
        i += down
    }
    
    return count
}

public func tobogganTrajectory2(arr: [String], slopes: [(right: Int, down: Int)]) -> Int {
    
    var total = 1
    
    for slope in slopes {
        total *= tobogganTrajectory(arr: arr, right: slope.right, down: slope.down)
    }
    
    return total
}

public func processInput3()  -> [String] {
    if let filepath = Bundle.main.path(forResource: "input3", ofType: "txt") {
        // Read all the data
        do {
            let contents = try String(contentsOfFile: filepath)
            
            let arr = contents.components(separatedBy: "\n")
            return arr.filter { $0.count != 0 }
        } catch {
        }
    }
    
    return []
}
