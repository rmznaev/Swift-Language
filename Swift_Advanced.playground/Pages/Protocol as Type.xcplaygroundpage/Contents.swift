//: [Previous](@previous)

import Foundation
import UIKit

let rmzn: Any = [1, "String", ["479"]]

//: Design Protocol

protocol EastAsianable {
    
    var useChopsticks: Bool { get }
    
    var origin: String { get }
    
}

extension EastAsianable {
    
    var useChopsticks: Bool {
        
        return true
        
    }
    
}

//: Create Blueprints

struct Korean: EastAsianable {
    
    var origin: String = "Korea"
    
}

class Japanese: EastAsianable {
    
    var origin: String = "Japan"
    
}

struct Chinese: EastAsianable {
    
    var origin: String = "China"
    
}

let eastAsians: [EastAsianable] = [Korean(), Japanese(), Chinese()]

for eastAsian in eastAsians {
    
    print("I'm from \(eastAsian.origin)")
    
}


//: Protocol Met Generics

protocol Sleekable {
    
    var price: String { get }
    
}

struct Diamond: Sleekable {
    
    var price: String = "Very High"
    
}

struct Ruby: Sleekable {
    
    var price: String = "High"
    
}

class Glass: Sleekable {
    
    var price: String = "Dirt Cheap"
    
}

func stateThePrice<T: Sleekable>(enterGem: T) {
    
    print("I'm expensive. In fact, I'm \(enterGem.price)")
    
}

//: [Next](@next)
