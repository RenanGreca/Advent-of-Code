//
//  2.swift
//  AdventOfCode2020
//
//  Created by Renan Greca on 02/12/20.
//

import Foundation

public func passwordPhilosophy(arr: [(min: Int, max: Int, char: Character, pass: String)]) -> Int {
    
    var validCount = 0
    for item in arr {
        let n = item.pass.filter{ $0 == item.char}.count
        if n >= item.min && n <= item.max {
            validCount += 1
        }
    }
    
    return validCount
}

public func passwordPhilosophy2(arr: [(min: Int, max: Int, char: Character, pass: String)]) -> Int {
    
    var validCount = 0
    for item in arr {
        let char1 = item.pass[atOffset: item.min-1]
        let char2 = item.pass[atOffset: item.max-1]
        
        if (char1 == item.char || char2 == item.char) && (char1 != char2) {
            validCount += 1
        }
    }
    
    return validCount
}

public func processInput2()  -> [(min: Int, max: Int, char: Character, pass: String)] {
    if let filepath = Bundle.main.path(forResource: "input2", ofType: "txt") {
        // Read all the data
        do {
            let contents = try String(contentsOfFile: filepath)
            
            let arr = contents.components(separatedBy: "\n")
            
            return arr.compactMap {
                let pt1 = $0.components(separatedBy: ": ")
                if pt1.count != 2 { return nil }
                let pass = pt1[1]
                let pt2 = pt1[0].components(separatedBy: " ")
                if pt2.count != 2 { return nil }
                let char = Character(pt2[1])
                let pt3 = pt2[0].components(separatedBy: "-")
                if pt3.count != 2 { return nil }
                if let min = Int(pt3[0]), let max = Int(pt3[1]) {
                    return (min: min, max: max, char: char, pass: pass)
                }
                return nil
            }
        } catch {
        }
    }
    
    return []
}
