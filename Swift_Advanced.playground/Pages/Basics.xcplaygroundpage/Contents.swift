//: [Previous](@previous)

import Foundation

let maxNumberOfLoginAttempts = 10
var currentLoginAttempts = 0

var welcomMessage: String

welcomMessage = "Salam"

var red, blue, green: Double

red = 0.23
blue = 0.44
green = 0.12

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjur!"

// let will compile-time error
var languageName = "Swift"
languageName = "Swift++"

print(friendlyWelcome)

print("The current value of friendlyWelcome is \(friendlyWelcome)")

// This is a comment.

let cat = "🐱"; print(cat)

let minValue = UInt8.min // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max // maxValue is equal to 255, and is of type UInt8

print(minValue)
print(maxValue)

let meaningOfLife = 42 // inferred to be of type Int
let pi = 3.14159 // inferred to be of type Double
let anotherPi = 3 + 3.14159 // inferred to be of type Double

print(anotherPi)

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

print(twoThousandAndOne)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let piAgain = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(piAgain)

print(piAgain)

typealias myNumber = UInt16
var minimumNumber = myNumber.min // minimum number for UInt is 0

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

//: Tuples

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is: \(statusCode)")
print("The status message is: \(statusMessage)")
let (justTheStatusCode,_) = http404Error
print("The status code is: \(justTheStatusCode)")

print("The status code is: \(http404Error.0)")
print("The status message is: \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is: \(http200Status.statusCode)")
print("The status message is: \(http200Status.description)")

//: [Next](@next)
