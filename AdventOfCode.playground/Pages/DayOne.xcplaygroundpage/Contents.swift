//: [Previous](@previous)

import Foundation

func readContents(filename:String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "txt")
    
    // get the contentData
    let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
    
    // get the string
    return NSString(data: contentData!, encoding: NSUTF8StringEncoding) as! String
}

/*
Santa is trying to deliver presents in a large apartment building, but he can't find the right floor - the directions he got are a little confusing. He starts on the ground floor (floor 0) and then follows the instructions one character at a time.

An opening parenthesis, (, means he should go up one floor, and a closing parenthesis, ), means he should go down one floor.

The apartment building is very tall, and the basement is very deep; he will never find the top or bottom floors.

For example:

(()) and ()() both result in floor 0.
((( and (()(()( both result in floor 3.
))((((( also results in floor 3.
()) and ))( both result in floor -1 (the first basement level).
))) and )())()) both result in floor -3.
To what floor do the instructions take Santa?
*/
func partOne(string:String) -> Int {
    //return 2*string.stringByReplacingOccurrencesOfString(")", withString: "").characters.count - string.characters.count
    
    var floor = 0
    for character in string.characters {
        floor += (character == "(" ? 1 : -1)
    }
    
    return floor
}

/*
Now, given the same instructions, find the position of the first character that causes him to enter the basement (floor -1). The first character in the instructions has position 1, the second character has position 2, and so on.

For example:

) causes him to enter the basement at character position 1.
()()) causes him to enter the basement at character position 5.
What is the position of the character that causes Santa to first enter the basement?
*/
func partTwo(string:String) -> Int {
    var floor = 0
    for (index, character) in string.characters.enumerate() {
        floor += (character == "(" ? 1 : -1)
        
        if floor == -1 {
            return index+1
        }
    }
    
    return 0
}

var string = Helpers.readContents("input")
partOne(string)

partTwo(string)

//: [Next](@next)
