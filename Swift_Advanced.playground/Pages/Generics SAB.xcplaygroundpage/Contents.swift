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



//: [Next](@next)
