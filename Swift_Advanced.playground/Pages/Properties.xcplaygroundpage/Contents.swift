//: [Previous](@previous)

import Foundation

// Properties - Swift Language Guide

// Stored properties
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
/* rangeOfFourItems.firstValue = 7 */ /// this will report an error, even though firstValue is a variable property


// Lazy stored properties
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.importer.fileName)


// Computed properties
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(
                x: origin.x + (size.width / 2),
                y: origin.y + (size.height / 2)
            )
        }
        set {
            origin.x = newValue.x + (size.width / 2)
            origin.y = newValue.y + (size.height / 2)
        }
    }
}

var square = Rect(
    origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0)
)

let initialSquareCenter = square.center
print(initialSquareCenter) /// initialSquareCenter is at (5.0, 5.0)

square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))") /// Prints "square.origin is now at (10.0, 10.0)"


// Read-Only Computed Properties
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)") /// Prints "the volume of fourByFiveByTwo is 40.0"



//: [Next](@next)
