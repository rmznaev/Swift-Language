//: [Previous](@previous)

import Foundation

// Control Flow


// FOR-IN LOOPS

let names = ["Sahil", "Asif", "Nicat", "Fariz"]

for name in names {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

print("---")
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

print("---")
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1

print("---")
for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

let minutes = 60
let minuteInterval = 5

print("---")
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark, terminator: " ")
}
print()

let hours = 12
let hourInterval = 3

print("---")
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print(tickMark, terminator: " ")
}
print()

print("---")
let board = [Int](repeating: 7, count: 4)
print(board)


// SWITCH

let someCharacter: Character = "z"

switch someCharacter {
case "a":
    print("First letter of alphabet")
case "z":
    print("Last letter of alphabet")
default:
    print("Some other character")
}


//: [Next](@next)
