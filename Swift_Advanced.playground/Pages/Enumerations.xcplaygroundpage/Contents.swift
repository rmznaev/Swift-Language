//: [Previous](@previous)

import Foundation

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west

directionToHead = .east

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// Iterating over Enumeration cases
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}


// Associated values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}


// Raw values
//enum ASCIIControlCharacter: Character {
//    case tab = "\t"
//    case lineFeed = "\n"
//    case carriageReturn = "\r"
//}
//
//enum Planet: Int {
//    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
//}
//
//enum CompassPoint: String {
//    case north, south, east, west
//}
//
//let earthsOrder = Planet.earth.rawValue
//
//let sunsetDirection = CompassPoint.west.rawValue
//
//let possiblePlanet = Planet(rawValue: 7)
//
//let positionToFind = 11

//if let somePlanet = Planet(rawValue: positionToFind) {
//    switch somePlanet {
//    case .earth:
//        print("Mostly harmless")
//    default:
//        print("Not a safe place for humans")
//    }
//} else {
//    print("There isn't a planet at position \(positionToFind)")
//}



//: [Next](@next)
