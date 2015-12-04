//: [Previous](@previous)

import Foundation

/*
Santa is delivering presents to an infinite two-dimensional grid of houses.
    
He begins by delivering a present to the house at his starting location, and then an elf at the North Pole calls him via radio and tells him where to move next. Moves are always exactly one house to the north (^), south (v), east (>), or west (<). After each move, he delivers another present to the house at his new location.

However, the elf back at the north pole has had a little too much eggnog, and so his directions are a little off, and Santa ends up visiting some houses more than once. How many houses receive at least one present?

For example:

> delivers presents to 2 houses: one at the starting location, and one to the east.
^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.
*/
func partOne(string:String) -> Int {
    let d:[Character:(Int, Int)] = [
        "^": (0, 1),
        ">": (1, 0),
        "v": (0, -1),
        "<": (-1, 0)
    ]
    
    var pos = (0, 0)
    
    var set = Set<String>()
    
    for character in string.characters {
        pos.0 += d[character]!.0
        pos.1 += d[character]!.1
        
        set.insert("\(pos)")
    }
    
    return set.count
}

/*
The next year, to speed up the process, Santa creates a robot version of himself, Robo-Santa, to deliver presents with him.

Santa and Robo-Santa start at the same location (delivering two presents to the same starting house), then take turns moving based on instructions from the elf, who is eggnoggedly reading from the same script as the previous year.

This year, how many houses receive at least one present?

For example:

^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.
^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.
^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other.

*/
func partTwo(string:String) -> Int {
    
    let d:[Character:(Int, Int)] = [
        "^": (0, 1),
        ">": (1, 0),
        "v": (0, -1),
        "<": (-1, 0)
    ]
    
    var pos: [(Int, Int)] = [(0, 0), (0, 0)]
    
    var sets = [Set<String>(), Set<String>()]
    
    var isRobotTurn = 0
    
    for character in string.characters {
        
        pos[isRobotTurn].0 += d[character]!.0
        pos[isRobotTurn].1 += d[character]!.1
        
        sets[isRobotTurn].insert("\(pos[isRobotTurn])")
        
        isRobotTurn = (isRobotTurn == 0 ? 1 : 0)
    }

    return sets[0].union(sets[1]).count
}

var string = Helpers.readContents("input")
partOne(string)

partTwo(string)

//: [Next](@next)
