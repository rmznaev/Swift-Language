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


//: [Next](@next)
