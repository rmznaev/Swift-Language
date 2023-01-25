//: [Previous](@previous)

import Foundation

// Initialization

struct Fahrenheit {
    var temperature: Double

    init() {
        temperature = 32.0
    }
}

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
/// Prints "The default temperature is 32.0° Fahrenheit"

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
/// boilingPointOfWater.temperatureInCelsius is 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
/// freezingPointOfWater.temperatureInCelsius is 0.0


// Optional Property Types
class SurveyQuestion {
    let text: String
    var response: String?

    init(text: String) {
        self.text = text
    }

    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."


// Default initializer
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()


// Memberwise Initialization for Structure types
struct Size {
    var width = 0.0
    var height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)
/// Prints "0.0 2.0"

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)
/// Prints "0.0 0.0"


// Initializer Delegation for Value Types
struct SizeAgain {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var origin = Point()
    var size = SizeAgain()

    init() {}

    init(origin: Point, size: SizeAgain) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: SizeAgain) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
/// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: SizeAgain(width: 5.0, height: 5.0))
/// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: SizeAgain(width: 3.0, height: 3.0))
/// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)


// Initializer Inheritance and Overriding
class Vehicle {
    var numberOfWheels = 0

    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class Hoverboard: Vehicle {
    var color: String

    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }

    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
/// Vehicle: 0 wheel(s)

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
/// Bicycle: 2 wheel(s)

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
/// Hoverboard: 0 wheel(s) in a beautiful silver


// Designated and Convenience Initializers in Action
class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int

    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }

    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingItem: RecipeIngredient {
    var purchased = false

    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

let namedMeat = Food(name: "Cow")
print(namedMeat.name)

let unamedMeat = Food()
print(unamedMeat.name)

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Cow")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

var breakfastList = [
    ShoppingItem(),
    ShoppingItem(name: "Cow"),
    ShoppingItem(name: "Eggs", quantity: 6),
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

for item in breakfastList {
    print(item.description)
}
// 1 x Orange juice ✔
// 1 x Cow ✘
// 6 x Eggs ✘


// Failable initialization
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
/// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
/// Prints "An animal was initialized with a species of Giraffe"


class Document {
    var name: String?

    init() {}

    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }

    override init?(name: String) {
        super.init()

        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

//: [Next](@next)
