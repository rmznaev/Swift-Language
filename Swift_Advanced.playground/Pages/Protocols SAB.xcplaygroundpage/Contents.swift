//: [Previous](@previous)

import Foundation


// - Swift Apprentice Book (Kodeko -> ex Raywenderlich)


// Introducing protocols
protocol Vehicle {
    func accelerate()
    func stop()
}


// Protocol syntax
class Unicycle: Vehicle {
    var peddling = false

    func accelerate() {
        peddling = true
    }

    func stop() {
        peddling = false
    }
}


// Methods in protocols
enum Direction {
    case left
    case right
}

protocol DirectionalVehicle {
    func accelerate()
    func stop()
    func turn(_ direction: Direction)
    func description() -> String
}


// Properties in protocols
protocol VehicleProperties {
    var weight: Int { get }
    var name: String { get set }
}


// Initializers in protocols
protocol Account {
    var value: Double { get set }
    init(initialAmount: Double)
    init?(transferAccount: Account)
}

class BitcoinAccount: Account {
    var value: Double

    required init(initialAmount: Double) {
        value = initialAmount
    }

    required init?(transferAccount: Account) {
        guard transferAccount.value > 0.0 else { return nil }
        value = transferAccount.value
    }
}

var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount: account)!


// Protocol inheritance
protocol WheeledVehicle: Vehicle {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

// Implementing protocols
class Bike: WheeledVehicle {
    var numberOfWheels = 2
    var wheelSize = 16.0
    
    var peddling = false
    var brakesApplied = false

    func accelerate() {
        peddling = true
        brakesApplied = false
    }
    
    func stop() {
        peddling = false
        brakesApplied = true
    }
}


// Associated types in protocols
protocol WeightCalculatable {
    associatedtype WeightType
    var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
    typealias WeightType = Int
    
    var weight: Int {
        100
    }
}

class LightThing: WeightCalculatable {
    typealias WeightType = Double

    var weight: Double {
        0.0025
    }
}


// Extensions & protocol conformance
protocol Reflective {
    var typeName: String { get }
}

extension String: Reflective {
    var typeName: String {
        "I'm a String"
    }
}

let title = "Swift Apprentice!"
title.typeName /// "I'm a String"

protocol Wheeled {
    var numberOfWheels: Int { get }
    var wheelSize: Double { get set }
}

class AnotherBike: Wheeled {
    var peddling = false
    let numberOfWheels = 2
    var wheelSize = 16.0
}

extension AnotherBike: Vehicle {
    func accelerate() {
        peddling = true
    }

    func stop() {
        peddling = false
    }
}


// Requiring reference semantics
protocol Named {
    var name: String { get set }
}

class ClassyName: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct StructyName: Named {
    var name: String
}

var classyNamed: Named = ClassyName(name: "Classy")
var classyCopy = classyNamed

classyNamed.name = "Still Classy?"
classyNamed.name /// Still Classy
classyCopy.name /// Still Classy


var structyNamed: Named = StructyName(name: "Structy")
var structyCopy = structyNamed

structyNamed.name = "Still Structy?"
structyNamed.name /// Still Structy?
structyCopy.name /// "Structy"


protocol NamedAgain: AnyObject {
    var name: String { get set }
}


// Equatable
class Record: Equatable {
    var wins: Int
    var losses: Int

    init(wins: Int, losses: Int) {
        self.wins = wins
        self.losses = losses
    }

    static func == (lhs: Record, rhs: Record) -> Bool {
        lhs.wins == rhs.wins && lhs.losses == rhs.losses
    }
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

recordA == recordB /// Build error!


//: [Next](@next)
