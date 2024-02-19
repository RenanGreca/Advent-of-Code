//
//  5.swift
//  AdventOfCode2020
//
//  Created by Renan Greca on 05/12/20.
//

import Foundation

public func binaryBoarding(arr: [String]) -> Int {

    var highestId = 0
    for bPass in arr where bPass.count != 0 {
        var row = String(bPass[withinOffsets: 0 ..< 7])
        var column = String(bPass[withinOffsets: 7 ..< 10])

        row = row.replacingOccurrences(of: "F", with: "0")
        row = row.replacingOccurrences(of: "B", with: "1")

        column = column.replacingOccurrences(of: "L", with: "0")
        column = column.replacingOccurrences(of: "R", with: "1")

        let iRow = Int(row, radix: 2)!
        let iColumn = Int(column, radix: 2)!

        let id = iRow * 8 + iColumn
        if id > highestId {
            highestId = id
        }

    }
    return highestId
}

public func binaryBoarding2(arr: [String]) -> Int {

    var ids = [Int]()
    for bPass in arr where bPass.count != 0 {
        var row = String(bPass[withinOffsets: 0 ..< 7])
        var column = String(bPass[withinOffsets: 7 ..< 10])

        row = row.replacingOccurrences(of: "F", with: "0")
        row = row.replacingOccurrences(of: "B", with: "1")

        column = column.replacingOccurrences(of: "L", with: "0")
        column = column.replacingOccurrences(of: "R", with: "1")

        let iRow = Int(row, radix: 2)!
        let iColumn = Int(column, radix: 2)!

        let id = iRow * 8 + iColumn
        ids.append(id)

    }
    ids.sort()

    for i in 1..<ids.count-1 {
        if !(ids[i] == ids[i-1] + 1 && ids[i] == ids[i+1] - 1) {
//            print (ids[i-1], ids[i], ids[i+1])
            return ids[i]+1
        }
    }
    
    return 0
    
}

public func processInput5()  -> [String] {
    if let filepath = Bundle.main.path(forResource: "input5", ofType: "txt") {
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
