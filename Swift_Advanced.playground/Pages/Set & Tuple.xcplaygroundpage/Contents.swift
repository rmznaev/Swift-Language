//: [Previous](@previous)

import Foundation

//: Set - Eliminate duplicated items
//: Tuple - Combine all kinds of types

//: Introducing Sets
// A set stores values of the same type in a collection with no defined ordering and no duplicated elements

//: Multiple ways to create an Arrays
var arrayOne: [Double] = []
var arrayTwo = [Double]()
var arrayThree: Array<Double> = Array()
var arrayFour: Array<Double> = []
var arrayFive = Array([1123.08, 234.23])
var arraySix = Array(1...100)
var arraySeven = Array(repeatElement("Bob", count: 10))

//: Multiple ways to create Sets
var setOne: Set = [1, 2, 3, 6, 4, 2, 4, 7, 9, 8, 5, 6, 3, 4]
var setTwo: Set<String> = ["Rmzn", "Ramazan", "Ramazan iOS Developer"]
var setThree = Set<String>()
var setFour = Set(["Rmzn", "Ramazan", "Ramazan iOS Developer"])

//: Built in Set Methods
setThree.insert("Rmzn")
setThree.contains("Rmzn") // true
setThree.remove("Bob")

//: Generate odd and even numbers
var oddNumbers: [Int] = []
var evenNumbers: [Int] = []

for number in 1...50 {
    if number % 2 == 0 {
        evenNumbers.append(number)
    } else {
        oddNumbers.append(number)
    }
}

print(oddNumbers)
print(evenNumbers)


// How to convert array to set?
var oddNumberSet = Set(oddNumbers)
var evenNumberSet = Set(evenNumbers)

print(oddNumberSet)
print(evenNumberSet)

//: Union
oddNumberSet.union(evenNumberSet)
print(oddNumberSet.union(evenNumberSet))

//: SymmetricDifference
oddNumberSet.symmetricDifference(evenNumberSet)
print(oddNumberSet.symmetricDifference(evenNumberSet))

//: Intersection
oddNumberSet.intersection(evenNumberSet)
print(oddNumberSet.intersection(evenNumberSet))

//: Subtraction
oddNumberSet.subtract(evenNumberSet)
print(oddNumberSet.subtract(evenNumberSet))


// Convert Sets to Sorted Array
let sortedArray = evenNumberSet.sorted()
print(sortedArray)

// Functional Programming
let sortedArrayFromHighToLow = evenNumberSet.sorted { $0 > $1 }
print(sortedArrayFromHighToLow)


//: Practical Usage of Sets
// 1. Finding unique letters
// 2. Finding unique visitors
// 3. Any game logic


// TUPLES

let firstScore = (name: "Rmzn", score: 9)

firstScore.0
firstScore.1

print(firstScore.0)
print(firstScore.1)

firstScore.name
firstScore.score

print(firstScore.name)
print(firstScore.score)

//: Practical Usage
let httpSuccess = (code: 200, description: "success")

httpSuccess.code

print(httpSuccess.code)


let httpFailture: [Any] = [401, "Fail"]

// Okay

var (x, y, z) = (1, 2, 3)

print(x)
print(z)


var shoppingList = ["Eggs", "Milk", "Rice"]

for (index, value) in shoppingList.enumerated() {
    print(index, value)
}

//: [Next](@next)
