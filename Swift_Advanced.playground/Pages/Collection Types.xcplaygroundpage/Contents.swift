//: [Previous](@previous)

import Foundation


// Arrays
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

// Appending an element
someInts.append(3)

// Emptying an array
someInts = []

// Creating an array with default value
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]

// Accessing and modifying an array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty!")
} else {
    print("The shopping list is not empty!")
}

// Add an item
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// Retrieve value by using subscript syntax
// Arrays in Swift are always zero-indexed
var firstItem = shoppingList[0]

// Use subscript syntax to change an existing value
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]

// Insert an item into the array
shoppingList.insert("Maple Syrup", at: 0)

let mapleSyrup = shoppingList.remove(at: 0)
firstItem = shoppingList[0]
let apples = shoppingList.removeLast()

// Iterating over an array
for item in shoppingList {
    print(item)
}

// Integer index of each item
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}



// Sets
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

// Insert an element
letters.insert("a")

// Emptying a Set
letters = []

// Creating a Set with an array literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip Hop"]
var favoriteGenresAgain: Set = ["Rock", "Classical", "Hip Hop"]

// Accessing and modifying a Set
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("Set is empty")
} else {
    print("Set is not empty")
}

favoriteGenres.insert("Jazz")

// return removed value
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

// Check if Set contains a particular item
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// Iterating over a Set
for genre in favoriteGenres {
    print(genre)
}

for genre in favoriteGenres.sorted() {
    print(genre)
}



// Dictionaries
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "Sixteen"
namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// Accessing and modifying a dictionary
print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("Dictionary is empty.")
} else {
    print("Dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
        print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"

// APL has now been removed from the dictionary
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

// Iterating over a Dictionary
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//: [Next](@next)
