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


// Swift Book reference

class Person {
    var residence: Residence?
}

class Room {
    let name: String

    init(name: String) {
        self.name = name
    }
}

class Residence {
    var address: Address?
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        } set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRows() {
        print("The number of rooms is \(numberOfRooms)")
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let asif = Person()
if let roomCount = asif.residence?.numberOfRooms {
    print("Asif's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve number of rooms")
}

asif.residence = Residence()
if let roomCount = asif.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve number of rooms")
}


// Accessing Subscripts Through Optional Chaining
if let firstRoomName = asif.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
/// Prints "Unable to retrieve the first room name."

asif.residence?[0] = Room(name: "Meeting room")

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
asif.residence = johnsHouse

if let firstRoomName = asif.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
/// Prints "The first room name is Living Room."


// Accessing Subscripts of Optional Type
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
/// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]




//: [Next](@next)
