//: [Previous](@previous)

import Foundation

// STRINGS & CHARACTERS

// String indices

let greeting = "Guten Tag!"

greeting[greeting.startIndex] // G

greeting[greeting.index(before: greeting.endIndex)] // !

greeting[greeting.index(after: greeting.startIndex)] // u

let index = greeting.index(greeting.startIndex, offsetBy: 7)

greeting[index] // a

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}



// Inserting & Removing

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



// Substrings

let hello = "Hello, world!"

// String index
let indexx = hello.firstIndex(of: ",") ?? hello.endIndex

// Hello
let beginning = hello[..<indexx]

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
