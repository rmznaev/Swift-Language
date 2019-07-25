//: [Previous](@previous)

import Foundation

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?

if convertedNumber != nil {
    print("convertedNumber contains some integer value of \(convertedNumber!).")
}

if let actualNumber = Int(possibleNumber) {
    print("The string \" \(possibleNumber) \" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}



//: [Next](@next)
