//: [Previous](@previous)

import Foundation

// - Collection Types

// Arrays - stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.

// Sets - stores distinct values of the same type in a collection with no defined ordering.

// Dictionaries - Unordered collections of key-value associations. Each value is associated with a unique key.



// - Arrays

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

// ------- Swift Apprentice Book

var players = ["Alice", "Bob", "Cindy", "Dan"]

print(players.isEmpty)

var currentPlayer = players.first
currentPlayer = players.max()

print([2, 3, 1].first as Any) // > Optional(2)
print([2, 3, 1].min() as Any) // > Optional(1)

var firstPlayer = players[0]
print("First player is \(firstPlayer)")

let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2])

players[1...3].contains("Bob") // true

for (index, player) in players.enumerated() {
    print("\(index+1) -> \(player)")
}

// - Sets

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

// ------- Swift Apprentice Book

/***
 A set is an unordered collection of unique values of the same type.
 This can be extremely useful when you want to ensure that an item doesn’t
 appear more than once in your collection and when the order of your items isn’t important.
*/

let setOne: Set<Int> = [1]
let someArray = [1, 2, 3, 1]
var explicitSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])
print(someSet)
// > [2, 3, 1] but the order is not defined

print(someSet.contains(1))  // > true
print(someSet.contains(4))  // > false

someSet.insert(5)
let removedElement = someSet.remove(1)
print(removedElement!)



// - Dictionaries

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

// ------- Swift Apprentice Book

var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores)

var pairs: [String: Int] = [:]
pairs.reserveCapacity(20)

print(namesAndScores["Anna"]!) // 2
print(namesAndScores["Greg"] ?? "nil") // nil

namesAndScores.isEmpty  //  false
namesAndScores.count    //  4

// Bob wants to join the game :-)
var bobData = [
  "name": "Bob",
  "profession": "Card Player",
  "country": "USA"
]

bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"

bobData.removeValue(forKey: "state")
bobData["city"] = nil

/***
 If you’re using a dictionary that has values that are optional types,
 dictionary[key] = nil still removes the key completely.
 If you want to keep the key and set the value to nil,
 you must use the updateValue method.
*/

for (player, score) in namesAndScores {
  print("\(player) -> \(score)")
}
// > Craig - 8
// > Anna - 2
// > Donna - 6
// > Brian - 2

for player in namesAndScores.keys {
  print("\(player), ", terminator: "") // no newline
}

//: [Next](@next)
