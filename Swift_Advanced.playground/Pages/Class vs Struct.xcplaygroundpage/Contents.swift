//: [Previous](@previous)

import Foundation

//: What are the differences besides inheritance?
//: When to use Structs over Classes?

//: Design a Class
class HumanClass {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

//: Create Instance
var humanClassObject = HumanClass(name: "Rmzn")
print(humanClassObject.name)

var newHumanClassObject = humanClassObject
newHumanClassObject.name = "Ramazan"

// Classes are reference types, they always point same memory address
humanClassObject.name
newHumanClassObject.name

//: Design Struct
struct HumanStruct {
    var name: String
    // In Swift struct automatically creates initialization method
    // If we need extra implementation during initialization wa can write init method
    
    /*
     init(name: String) {
        self.name = name
     }
     */
}

var structObject = HumanStruct(name: "Rmzn")
var newStructObject = structObject
newStructObject.name = "Ramazan"

// Structures are value types, they create different memory address for all objects created
print(structObject.name)
print(newStructObject.name)


//: ### One More Difference in Mutability
//: Mutable Class
class RmznClass {
    var name = "Rmzn"
    
//    init(name: String) {
//        self.name = name
//    }
}

let rmznClass = RmznClass()
rmznClass.name = "Ramazan"


//: Immutable Struct
struct RmznStruct {
    var name = "Rmzn"
}

// We can't use constant in structures
var rmznStruct = RmznStruct()
rmznStruct.name = "Ramazan"
rmznStruct.name

// Structures are 10,000 - 1,000,000 times faster than classes
// No mutability due to no relationship between objects
// Non-nested structure

//: [Next](@next)
