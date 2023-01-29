//: [Previous](@previous)

import Foundation

//: 1 - Warn that the function can cause dangerous results
//: 2 - Understanding of a do-try block
//: 3 - Distinguish between try!, try? and try

func checkHeight(height: Int) {
    if height > 200 {
        print("You are going to hit your head and fall of")
    } else if height < 140 {
        print("You might fly in the air")
    } else {
        print("Enjoy!")
    }
}

//: Problem with an else-if statement
// Problem 1: Bloated Function
// Problem 2: Modularity


//: ERROR HANDLING - is just another way to write an if-else statement to deal with error messages

// Design Error (1/3)
enum HeightError: Error {
    case maxHEight
    case minHeight
}

// Call Function (2/3)
func checkHeightError(height: Int) throws {
    if height > 200 {
        throw HeightError.maxHEight
    } else if height < 140 {
        throw HeightError.minHeight
    } else {
        print("Enjoy!")
    }
}

// Handle with Error (3/3)
do {
    try checkHeightError(height: 200)
} catch HeightError.maxHEight {
    print("You are too tall!")
} catch HeightError.minHeight {
    print("You are too short!")
}


// Error Handling with Object Initialization

// Design Error (1/3)
enum NameError: Error {
    case noName
}

// Design Class (2/3)
class Course {
    var name: String
    
    init(name: String) throws {
        if name == "" {
            throw NameError.noName
        } else {
            self.name = name
            print("Hey, you have created an object!")
        }
    }
}

// Handle with Error (3/3)
do {
    let myCourse = try Course(name: "Learn Swift with Rmzn")
} catch NameError.noName {
    print("Make sure enter your name please!")
}


// Distinguish 'try?', 'try!', and 'try'

// try?
let newCourse = try? Course(name: "")

// try!
let myNewCourse = try! Course(name: "Swift with Rmzn")

// When it comes to the real programming, to use the simple try is the better approach



// - Swift Language Guide

// Representing and Throwing Errors
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 7)


// Propagating Errors Using Throwing Functions
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else  {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(
                coinsNeeded: item.price - coinsDeposited
            )
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }

    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
}

struct PurchasedSnack {
    let name: String

    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

//: [Next](@next)
