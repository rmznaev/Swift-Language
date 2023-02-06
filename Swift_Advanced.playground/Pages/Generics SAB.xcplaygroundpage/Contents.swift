//: [Previous](@previous)

import Foundation

// - Swift Apprentice Book
// Generics

enum PetKind {
    case cat
    case dog
}

struct KeeperKind {
    var keeperOf: PetKind
}

let catKeeper = KeeperKind(keeperOf: .cat)
let dogKeeper = KeeperKind(keeperOf: .dog)

enum EnumKeeperKind {
    case catKeeper
    case dogKeeper
}


// Using type parameters
protocol Pet {
    var name: String { get }  /// all pets respond to a name
}

protocol Meowable {
  func meow()
}

class Cat {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Dog {
    var name: String

    init(name: String) {
        self.name = name
    }
}

extension Cat: Pet {}
extension Dog: Pet {}

extension Cat: Meowable {
    func meow() {
        print("\(self.name) says meow!")
    }
}

class Keeper<Animal: Pet> {
    var name: String
    var morningCare: Animal
    var afternoonCare: Animal

    init(
        name: String,
        morningCare: Animal,
        afternoonCare: Animal
    ) {
        self.name = name
        self.morningCare = morningCare
        self.afternoonCare = afternoonCare
    }
}

extension Array: Meowable where Element: Cat {
    func meow() {
        forEach { print("\($0.name) says meow!") }
    }
}

let jason = Keeper(name: "Jason",
                   morningCare: Cat(name: "Whiskers"),
                   afternoonCare: Cat(name: "Sleepy"))


//: [Next](@next)
