//: [Previous](@previous)

import Foundation

// STRINGS & CHARACTERS

// - String literals

let someString = "Some string literal value"

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."

let multilineString = """
These are the same.
"""

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// - Initializing an Empty String

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

if emptyString.isEmpty {
    print("Nothing to see here!")
}
// Prints "Nothing to see here"

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

//let constantString = "Highlander"
//constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified

// - Working with Characters

for character in "Dog!🐶" {
    print(character)
}

// You can’t append a String or Character to an existing Character variable, because a Character value must contain a single character only.

// - String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

// - Accessing and Modifying a String
// Each String value has an associated index type, String.Index, which corresponds to the position of each Character in the string.

// String indices
let greeting = "Guten Tag!"
let congratulating = "Congratulations!"

greeting[greeting.startIndex] // G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u

congratulating[congratulating.startIndex] // C
congratulating[congratulating.index(before: congratulating.endIndex)] // !
congratulating[congratulating.index(after: congratulating.startIndex)] // o

let index = greeting.index(greeting.startIndex, offsetBy: 7)
let congratsIndex = congratulating.index(congratulating.startIndex, offsetBy: 3)

greeting[index] // a
congratulating[congratsIndex] // g

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

print("\n")

for index in congratulating.indices {
    print("\(congratulating[index]) ", terminator: "")
}

// - Inserting & Removing

var welcome = "hello"

// hello!
welcome.insert("!", at: welcome.endIndex)

// hello there!
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))

// hello there
welcome.remove(at: welcome.index(before: welcome.endIndex))

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex

// hello
welcome.removeSubrange(range)



// - Substrings

let hello = "Hello, world!"

// String index
let commaIndex = hello.firstIndex(of: ",") ?? hello.endIndex

// Hello
let beginning = hello[..<commaIndex]

// Created new string from hello
let newString = String(beginning)


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes in Act 1")


var mansionCount = 0
var cellCount = 0

for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


let stringOne = "Maman"

for index in stringOne.indices {
    print(stringOne[index])
}

for (n, x) in stringOne.enumerated() {
    print(n, x)
}

print(stringOne.lowercased())

stringOne.startIndex
stringOne.endIndex

//: [Next](@next)
