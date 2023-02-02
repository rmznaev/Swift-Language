//: [Previous](@previous)

import Foundation

// - Protocols -> from Swift Language Guide
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}


// Property Requirements
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")
print(john.fullName)

class Starship: FullyNamed {
    var prefix: String?
    var name: String

    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }

    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
/// ncc1701.fullName is "USS Enterprise"


// Method Requirements
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0

    func random() -> Double {
        return ((lastRandom * a + c).truncatingRemainder(dividingBy:m)) / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
/// Prints "Here's a random number: 0.3746499199817101"
print("And another one: \(generator.random())")
/// Prints "And another one: 0.729023776863283"
    
//: [Next](@next)
