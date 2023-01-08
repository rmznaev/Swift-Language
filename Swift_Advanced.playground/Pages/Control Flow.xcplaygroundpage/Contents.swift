//: [Previous](@previous)

import Foundation

// - Control Flow

let yes = true
let no = false

let doesOneEqualsToTwo = (1 == 2)
let checkAgain = (1 != 2)
let alsoTrue = !(1 == 2)

let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

let and = true && true
let or = true || false

let andTrue = 12 > 2 && 4 < 7
let andFalse = 12 < 2 && 4 > 7

let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

let andOr = (1 < 2 && 3 > 4) || 1 < 4

let guess = "dog"
let isEqualsCat = (guess == "cat")
let order = "cat" < "dog"

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

let number = 10

switch number {
case 0:
    print("Zero")
case 10:
    print("It's ten")
default:
    print("Non-zero")
}

let string = "Dog"

switch string {
case "Cat", "Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}

let hourOfDay = 12
var timeOfDay = ""

switch hourOfDay {
case 0, 1, 2, 3, 4, 5:
    timeOfDay = "Early morning"
case 6, 7, 8, 9, 10, 11:
    timeOfDay = "Morning"
case 12, 13, 14, 15, 16:
    timeOfDay = "Afternoon"
case 17, 18, 19:
    timeOfDay = "Evening"
case 20, 21, 22, 23:
    timeOfDay = "Late evening"
default:
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

var timeOfDayAgain = ""

switch hourOfDay {
case 0...5:
    timeOfDay = "Early morning"
case 6...11:
    timeOfDay = "Morning"
case 12...16:
    timeOfDay = "Afternoon"
case 17...19:
    timeOfDay = "Evening"
case 20...24:
    timeOfDay = "Late evening"
default:
    timeOfDay = "INVALID HOUR!"
}

switch number {
case let x where x % 2 == 0:
    print("Even")
default:
    print("Odd")
}

switch number {
case _ where number % 2 == 0:
    print("Even")
default:
    print("Odd")
}

// partial matching
let coordinates = (x: 3, y: 2, z: 5)

switch coordinates {
case (0, 0, 0):
    print("Origin")
case (_, 0, 0):
    print("On the x-axis")
case (0, _, 0):
    print("On the y-axis")
case (0, 0, _):
    print("On the z-axis")
default:
    print("Somewhere in space")
}

switch coordinates {
case (0, 0, 0):
  print("Origin")
case (let x, 0, 0):
  print("On the x-axis at x = \(x)")
case (0, let y, 0):
  print("On the y-axis at y = \(y)")
case (0, 0, let z):
  print("On the z-axis at z = \(z)")
case let (x, y, z):
  print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

switch coordinates {
case let (x, y, _) where y == x:
    print("Along the y = x line.")
case let (x, y, _) where y == x * x:
    print("Along the y = x^2 line.")
default:
    break
}


// WHILE

var sum = 1

repeat {
    print("sum is \(sum) now")
    sum += 1
} while sum <= 7


// RANGE

let closedRange = 0...5     // [0-5]
let halfOpenRange = 0..<5   // [0-4]


//: [Next](@next)
