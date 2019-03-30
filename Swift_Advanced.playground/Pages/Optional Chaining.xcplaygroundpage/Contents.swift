//: [Previous](@previous)

import Foundation

class Human {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sayHello() {
        print("Hello, I'm \(name)!")
    }
}

class Apartment {
    var human: Human? = nil
}

// Initialize
var talaApartment = Apartment()
talaApartment.human = Human(name: "Ramazan Abdullayev")

// Force Unwrapping
talaApartment.human?.sayHello()
let name = talaApartment.human!.name

// Implicit/Safe Unwrapping
let nycApartment = Apartment()
nycApartment.human = Human(name: "Sahil Akberov")
nycApartment.human?.name

if let residentName = nycApartment.human?.name {
    print(residentName)
} else {
    print("No name available!")
}

//: [Next](@next)
