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


// Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps


// Property Wrappers
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var width: Int
    @TwelveOrLess var height: Int
}

var rectangle = SmallRectangle()

print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"

/* For example, here’s a version of SmallRectangle from the previous code
 listing that wraps its properties in the TwelveOrLess structure explicitly,
 instead of writing @TwelveOrLess as an attribute: */
struct SmallRectangleAgain {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}



@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// Prints "0 0"

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// Prints "1 1"

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// Prints "2 3"

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// Prints "1"

mixedRectangle.height = 20
print(mixedRectangle.height)
// Prints "12"


// Projecting a Value From a Property Wrapper
@propertyWrapper
struct ProjectingSmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure {
    @ProjectingSmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"


enum RectangleSize {
    case small
    case large
}

struct SizedRectangle {
    @ProjectingSmallNumber var height: Int
    @ProjectingSmallNumber var width: Int

    mutating func resize(to size: RectangleSize) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }

        return $height || $width
    }
}


// - Swift Apprentice book

//Stored Properties
struct Contact {
    var fullName: String
    let emailAddress: String
    var relationship = "Friend"
}

var person = Contact(
    fullName: "Ramazan Abdullayev",
    emailAddress: "ramazan.aev@gmail.com"
)

print(person.fullName)
print(person.emailAddress)

/// You can assign values to properties as long as both the property and the structure containing the property must be declared with var instead of let
person.fullName = "Ramazan Abdulla"
print(person.fullName)


// Computed properties
struct TV {
    var height: Double
    var width: Double

    var diagonal: Int {
        return Int((height * height + width * width).squareRoot().rounded())
    }
}

var tv = TV(height: 53.93, width: 95.87)
print(tv.diagonal) // 110

tv.width = tv.height
print(tv.diagonal) // 76


// Getter and setter
struct Television {
    var height: Double
    var width: Double
    
    var diagonal: Int {
      get {
        let result = (height * height +
          width * width).squareRoot().rounded()
        return Int(result)
      }
      set {
        let ratioWidth = 16.0
        let ratioHeight = 9.0
        let ratioDiagonal = (ratioWidth * ratioWidth +
          ratioHeight * ratioHeight).squareRoot()
        height = Double(newValue) * ratioHeight / ratioDiagonal
        width = height * ratioWidth / ratioHeight
      }
    }
}

var television = Television(height: 53.93, width: 95.87)
television.diagonal = 70
print(television.height) // 34.32...
print(television.width) // 61.01...


// Type properties
struct Level {
    static var highestLevel = 1

    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)


// Limiting a variable
struct LightBulb {
    static let maxCurrent = 40
    var current = 0 {
        didSet {
            if current > LightBulb.maxCurrent {
                print("""
                    Current is too high,
                    falling back to previous setting.
                    """)
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.current = 50
light.current // 0
light.current = 40
light.current // 40


// Lazy properties
struct Circle {
    lazy var pi = {
        ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
    }()

    var radius = 0.0

    var circumference: Double {
        mutating get {
            pi * radius * 2
        }
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5) /// got a circle, pi has not been run
circle.circumference

//: [Next](@next)
