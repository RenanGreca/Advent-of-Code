//
//  4.swift
//  AdventOfCode2020
//
//  Created by Renan Greca on 04/12/20.
//

import Foundation

let requiredFields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

struct Passport {
    
}

public func passportProcessing(passports: [[String: String]]) -> Int {
    
    var validPassports = 0
    for passport in passports {
        var fields = 0
        for field in requiredFields {
            if passport.keys.contains(field) {
               fields += 1
            }
        }
        if fields == requiredFields.count {
            validPassports += 1
        }
    }
    return validPassports
    
}

public func passportProcessing2(passports: [[String: String]]) -> Int {
    
    var validPassports = 0
    for passport in passports {
        var fields = 0
        for field in requiredFields {
            if passport.keys.contains(field) && isValid(key: field, value: passport[field]) {
               fields += 1
            }
        }
        if fields == requiredFields.count {
            validPassports += 1
        }
    }
    return validPassports
    
}

func isValid(key: String, value: String?) -> Bool {
    guard let value = value else { return false }
    
    let intValue = Int(value) ?? 0
    switch key {
    case "byr":
        return intValue >= 1920 && intValue <= 2002
    case "iyr":
        return intValue >= 2010 && intValue <= 2020
    case "eyr":
        return intValue >= 2020 && intValue <= 2030
    case "hgt":
        if value.contains("cm") {
            let intValue = Int(value.trimmingCharacters(in: .lowercaseLetters)) ?? 0
            return intValue >= 150 && intValue <= 193
        }
        if value.contains("in") {
            let intValue = Int(value.trimmingCharacters(in: .lowercaseLetters)) ?? 0
            return intValue >= 59 && intValue <= 76
        }
        return false
    case "hcl":
        return value.trimmingCharacters(in: CharacterSet(charactersIn: "abcdef0123456789")) == "#"
    case "ecl":
        return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(value)
    case "pid":
        return value.count == 9 && value.trimmingCharacters(in: .letters).count == 9
    default:
        return false
    }
}

public func processInput4() -> [[String: String]] {
    if let filepath = Bundle.main.path(forResource: "input4", ofType: "txt") {
        // Read all the data
        do {
            let contents = try String(contentsOfFile: filepath)
            
            let arr = contents.components(separatedBy: "\n\n")
            
            var output = [[String:String]]()
            
            for passport in arr where passport.count != 0 {
                let fields = passport.components(separatedBy: .whitespacesAndNewlines)
                
                var fieldOutput = [String:String]()
                for field in fields where field.count != 0{
                    let data = field.components(separatedBy: ":")
                    
                    fieldOutput[data[0]] = data[1]
                }
                output.append(fieldOutput)
            }
            
            return output
        } catch {
        }
    }
    
    return [[:]]
}
