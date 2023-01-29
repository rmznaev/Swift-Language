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

//throw VendingMachineError.insufficientFunds(coinsNeeded: 7)


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
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String

    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


// Handling Errors Using Do-Catch
var vendingMachine = VendingMachine()
//vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Amrah", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid selection!")
} catch VendingMachineError.outOfStock {
    print("Out of stock!")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}


func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}
/// Prints "Couldn't buy that from the vending machine."


func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch
        VendingMachineError.invalidSelection,
        VendingMachineError.insufficientFunds,
        VendingMachineError.outOfStock
    {
        print("Invalid selection, out of stock, or not enough money.")
    }
}


// Converting Errors to Optional Values
func someThrowingFunction() throws -> Int {
    5
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

func fetchDataFromDisk() throws -> Data? { Data() }
func fetchDataFromServer() throws -> Data? { nil }

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}


// - Swift Apprentice book


// Failable initializers
let value = Int("3")          /// Optional(3)
let failedValue = Int("nope") /// nil

enum PetFood: String {
    case kibble, canned
}

let morning = PetFood(rawValue: "kibble")  /// Optional(.kibble)
let snack = PetFood(rawValue: "fuuud!")    /// nil

struct PetHouse {
    let squareFeet: Int

    init?(squareFeet: Int) {
        guard squareFeet >= 1 else { return nil }
        self.squareFeet = squareFeet
    }
}

let tooSmall = PetHouse(squareFeet: 0) /// nil
let house = PetHouse(squareFeet: 1)    /// Optional(Pethouse)


// Optional Chaining
class Toy {
    enum Kind {
        case ball, zombie, bone, mouse
    }

    enum Sound {
        case squeak, bell
    }

    let kind: Kind
    let color: String
    var sound: Sound?

    init(kind: Kind, color: String, sound: Sound? = nil) {
        self.kind = kind
        self.color = color
        self.sound = sound
    }
}

class Pet {
    enum Kind {
        case dog, cat, guineaPig
    }

    var name: String
    var kind: Kind
    var favoriteToy: Toy?

    init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
        self.name = name
        self.kind = kind
        self.favoriteToy = favoriteToy
    }
}

class Person {
    let pet: Pet?

    init(pet: Pet? = nil) {
        self.pet = pet
    }
}

//let delia = Pet(breed: "pug")
//let olive = Pet()

//let janie = Person(pet: olive)
/* let dogBreed = janie.pet.breed! */ /// This is bad! Will cause a crash!

//if let dogBreed = janie.pet?.breed {
//    print("Olive is a \(dogBreed).")
//} else {
//    print("Olive’s breed is unknown.")
//}

let janie = Person(pet: Pet(name: "Delia", kind: .dog,
                   favoriteToy: Toy(kind: .ball,
                   color: "Purple", sound: .bell)))
let tammy = Person(pet: Pet(name: "Evil Cat Overlord",
                   kind: .cat, favoriteToy: Toy(kind: .mouse,
                   color: "Orange")))
let felipe = Person()


// Map and compactMap
let team = [janie, tammy, felipe]

let petNames = team.map { $0.pet?.name }
print("Pet names: \(petNames)")

let petNamesWithoutOptional = team.compactMap { $0.pet?.name }
print("Pet names without optional: \(petNamesWithoutOptional)")



// Error protocol
enum BakeryError: Error {
    case tooFew(numberOnHand: Int)
    case doNotSell
    case wrongFlavor
    case inventory
    case noPower
}

class Pastry {
    let flavor: String
    var numberOnHand: Int

    init(flavor: String, numberOnHand: Int) {
        self.flavor = flavor
        self.numberOnHand = numberOnHand
    }
}

// Throwing errors
class Bakery {
    var itemsForSale = [
        "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
        "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
        "Donut" : Pastry(flavor: "Sprinkles", numberOnHand: 24),
        "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
    ]

    func open(_ now: Bool = Bool.random()) throws -> Bool {
        guard now else {
            throw Bool.random() ? BakeryError.inventory : BakeryError.noPower
        }

        return now
    }

    func orderPastry(
        item: String,
        amountRequested: Int,
        flavor: String
    ) throws -> Int {
        guard let pastry = itemsForSale[item] else {
            throw BakeryError.doNotSell
        }

        guard flavor == pastry.flavor else {
            throw BakeryError.wrongFlavor
        }

        guard amountRequested <= pastry.numberOnHand else {
            throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
        }

        pastry.numberOnHand -= amountRequested
        return pastry.numberOnHand
    }
}

//let bakery = Bakery()
//bakery.open()
//bakery.orderPastry(item: "Albatross",
//                   amountRequested: 1,
//                   flavor: "AlbatrossFlavor")

// Handling errors
let bakery = Bakery()

do {
    try bakery.open()
    try bakery.orderPastry(item: "Albatross",
                          amountRequested: 1,
                          flavor: "AlbatrossFlavor")
} catch BakeryError.inventory, BakeryError.noPower {
    print("Sorry, the bakery is now closed.")
} catch BakeryError.doNotSell {
    print("Sorry, but we don’t sell this item.")
} catch BakeryError.wrongFlavor {
    print("Sorry, but we don’t carry this flavor.")
} catch BakeryError.tooFew {
    print("Sorry, we don’t have enough items to fulfill your order.")
}

// Not looking at the detailed error
let open = try? bakery.open(false)
let remaining = try? bakery.orderPastry(item: "Albatross",
                                        amountRequested: 1,
                                        flavor: "AlbatrossFlavor")


// Stoping your program on an error
do {
    try bakery.open(true)
    try bakery.orderPastry(item: "Cookie",
                           amountRequested: 1,
                           flavor: "ChocolateChip")
} catch {
    fatalError()
}

// or..
try! bakery.open(true)
try! bakery.orderPastry(item: "Cookie",
                        amountRequested: 1,
                        flavor: "ChocolateChip")

//: [Next](@next)
