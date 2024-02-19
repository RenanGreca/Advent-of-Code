import Foundation

let file = "1.txt"
let url = URL(fileURLWithPath: file)
guard let text = try? String(contentsOf: url, encoding: .utf8) else { 
    print("Error reading file \(file)")
    exit(1) 
}

// let test = """
// 1abc2
// pqr3stu8vwx
// a1b2c3d4e5f
// treb7uchet
// """
let test = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""

let input = CommandLine.arguments.count > 1 ? text : test

let lines = input.split(separator: "\n")

let digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

let digitMap = [
    "one": "1",
    "1": "1",
    "two": "2",
    "2": "2",
    "three": "3",
    "3": "3",
    "four": "4",
    "4": "4",
    "five": "5",
    "5": "5",
    "six": "6",
    "6": "6",
    "seven": "7",
    "7": "7",
    "eight": "8",
    "8": "8",
    "nine": "9",
    "9": "9",
    "zero": "0",
    "0": "0"
]

func extractDigits(line: Substring) -> [String] {
    var numbers: [String] = []
    for i in 0..<line.count {
        let index = line.index(line.startIndex, offsetBy: i)
        let substr = line[index...]
        for (number, digit) in digitMap {
            if substr.starts(with: number) {
                numbers.append(digit)
            }
        }
    }
    return numbers
}

var sum = 0
for line in lines {
    let numbers = extractDigits(line: line)
    print("\(line): \(numbers.joined(separator: ","))")
    let a = numbers.first!
    let b = numbers.last!
    let c = "\(a)\(b)"
    print("\(a) + \(b) = \(c)")
    sum += Int(c)!
}
print(sum)
