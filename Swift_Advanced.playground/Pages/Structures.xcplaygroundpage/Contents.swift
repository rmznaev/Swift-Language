//: [Previous](@previous)

import Foundation

// - Structures
/// Structures are types that can store named properties and define actions and behaviors.

let restaurantLocation = (3, 3)
let restaurantRange = 2.5

// Pythagorean Theorem 📐🎓
func distance(
    from source: (x: Int, y: Int),
    to target: (x: Int, y: Int)
) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
  let deliveryDistance = distance(from: location, to: restaurantLocation)
  return deliveryDistance < restaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5)) // false

// Converting this to Structure

struct Location {
    let x: Int
    let y: Int
}

struct DeliveryArea {
    let center: Location
    var radius: Double
    
    func isInDeliveryRange() -> Bool {
        let deliveryDistance = distance(
            from: center, to: Location(
                x: restaurantLocation.0,
                y: restaurantLocation.1
            )
        )

        return deliveryDistance < restaurantRange
    }

    private func distance(
        from source: Location,
        to target: Location
    ) -> Double {
        let distanceX = Double(source.x - target.x)
        let distanceY = Double(source.y - target.y)
        return (distanceX * distanceX + distanceY * distanceY).squareRoot()
    }
}

struct PizzaOrder {
    let toppings: [String]
    let size: Double
    let price: Double
}

let storeLocation = Location(x: 3, y: 3)
var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

print(storeArea.radius)
print(storeArea.center.x)

storeArea.radius = 3.5

print(storeArea.radius)

let fixedArea = DeliveryArea(center: storeLocation, radius: 4)

//fixedArea.radius = 5 // ----> Cannot assign to property...

let customerLocation1 = Location(x: 2, y: 3)
let customerLocation2 = Location(x: 7, y: 7)

let deliveryAreaOne = DeliveryArea(center: customerLocation1, radius: 2.5)
let deliveryAreaTwo = DeliveryArea(center: customerLocation2, radius: 2.5)

deliveryAreaOne.isInDeliveryRange()
deliveryAreaTwo.isInDeliveryRange()


// Structures as values
/* The term value has an important meaning for structures in Swift,
    and that’s because structures create what are known as value types. */

var a = 5
var b = a

a // 5
b // 5

a = 10

a // 10
b // 5


//: [Next](@next)
