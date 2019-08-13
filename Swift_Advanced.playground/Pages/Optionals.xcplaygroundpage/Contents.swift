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


// Successful
let myProfileImageURL: String? = "https//facebook.com/rmznabb"

let myName: String? = nil
let yourName: String? = "Rmzn"

//print(myName!) // nil -> ERROR (YOU CANNOT FORCE UNWRAP nil VALUE )
print(yourName!) // Optional("Rmzn")

let rmznAge: Int? = 24
let shlAge: Int? = 23
let nctAge: Int? = 27

let newRmznAge = rmznAge!
print(newRmznAge) // normal type

let newShlAge = shlAge!
print(newShlAge) // normal type

// Problem
var image: String? = "rmzn.jpg" // CANNOT BE nil VALUE -> ERROR
var hahaha: String? = image

print(hahaha!)


// IMPLICIT UNWRAPPING

let imageFromFaceBook: String? = nil // "Rmzn's Photo"

if let normalImage = imageFromFaceBook {
    print(normalImage)
} else {
    print("There is no image!")
}

//: [Next](@next)
