//: [Previous](@previous)

import Foundation

//: The parameters are unreadable and boring

// Typealias for string
typealias Name = String

func insertName(name: Name) {
    print(name)
}

// Typealias for custom class
class Employee {
    
}

typealias MyEmployees = [Employee]
func listEmployees(enterEmployees: MyEmployees) {
    
}

listEmployees(enterEmployees: [Employee(), Employee()])

typealias GridPoint = (Int, Int)

func enterPoint(grid: GridPoint) {
    print(grid.0)
    print(grid.1)
}

enterPoint(grid: (1, 2))


//: Type Definition

//: Array Type
let arrayOne: Array<String> = Array(["Rmzn", "Ramazan"]) // 2
let arrayTwo: [String] = ["Rmzn", "Ramazan"] //1
arrayOne.isEmpty

//: Dictionary Type
let dictOne: [String: Int] = ["Alex": 31, "Paul": 39] // 1
let dictTwo: Dictionary<String, Int> = ["Alex": 31, "Paul": 39] // 2

//: Optional Type
var optionalOne: String? // 1
var optionalTwo: Optional<String> // 2


//: [Next](@next)
