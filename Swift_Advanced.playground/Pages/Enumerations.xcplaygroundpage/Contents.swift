//: [Previous](@previous)

import Foundation


// - Enumerations


// Enumeration Syntax

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


// Iterating over Enumeration Cases

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
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode)")
}


// Raw values

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum PlanetAgain: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPointAgain: String {
    case north, south, east, west
}

let earthsOrder = PlanetAgain.earth.rawValue
let sunsetDirection = CompassPointAgain.west.rawValue
let possiblePlanet = PlanetAgain(rawValue: 7)
let positionToFind = 11

if let somePlanet = PlanetAgain(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


// - Swift Apprentice book

let months = [
    "January", "February", "March", "April", "May",
    "June", "July", "August", "September", "October",
    "November", "December"
]

func semester(for month: String) -> String {
    switch month {
    case "August", "September", "October", "November", "December":
        return "Autumn"
    case "January", "February", "March", "April", "May":
        return "Spring"
    default:
        return "Not in the school year"
    }
}

semester(for: "December")

enum Month {
  case january, february, march,
       april, may, june, july, august,
       september, october, november, december
}

func semester(for month: Month) -> String {
    switch month {
    case .august, .september, .october, .november, .december:
        return "Autumn"
    case .january, .february, .march, .april, .may:
        return "Spring"
    case .june, .july:
        return "Summer"
    }
}

var month = Month.april
semester(for: month) // "Spring"

month = .september
semester(for: month) // "Autumn"


// Raw values

enum RawMonth: Int {
    case january = 1, february, march,
         april, may, june, july, august,
         september, october, november, december
}

func monthsUntilWinterBreak(from month: RawMonth) -> Int {
    RawMonth.december.rawValue - month.rawValue
}

let fifthMonth = RawMonth.may // RawMonth(rawValue: 5)!
monthsUntilWinterBreak(from: fifthMonth)


// String raw values

enum Icon: String {
    case music
    case sports
    case weather
    
    var filename: String {
        "\(rawValue).png"
    }
}

let icon = Icon.weather
print(icon.filename) // weather.png


// Unordered raw values

enum Coin: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coin = Coin.quarter
coin.rawValue // 25


// Associated values

var balance = 100

enum WithdrawalResult {
    case success(newBalance: Int)
    case error(message: String)
}

func withdraw(amount: Int) -> WithdrawalResult {
    if amount <= balance {
        balance -= amount
        return .success(newBalance: balance)
    } else {
        return .error(message: "Not enough money!")
    }
}

let result = withdraw(amount: 99)

switch result {
case .success(let newBalance):
    print("Your current balance is: \(newBalance)")
case .error(let message):
    print(message)
}


enum HTTPMethod {
    case get
    case post(body: String)
}

let request = HTTPMethod.post(body: "Hi there!")

guard case .post(let body) = request else {
    fatalError("No message was posted")
}
print(body)


// Enumeration as a state machine

enum TrafficLight {
    case red, yellow, green
}

let trafficLight = TrafficLight.red


// Iterating through all cases

enum Pet: CaseIterable {
    case cat, dog, bird, turtle, fish, hamster
}

for pet in Pet.allCases {
    print(pet)
}


// Enumerations without any cases

enum Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}

let factorial = Math.factorial(of: 6) // 720
print(factorial)


// Optionals

var age: Int?
age = 17
age = .some(7)
age = .none

switch age {
case .some(let value):
    print("Got a value: \(value)")
case .none:
    print("No value")
}

let optionalNil: Int? = .none
optionalNil == nil    // true
optionalNil == .none  // true


// - Challenges

// 1
enum CoinAgain: Int {
    case penny = 1
    case nickel = 5
    case dime = 10
    case quarter = 25
}

let coinPurse: [CoinAgain] = [
    .penny, .quarter, .nickel,
    .dime, .penny, .dime, .quarter
]

func calculateCoins(coins: [CoinAgain]) -> Int {
    coins.reduce(0) { $0 + $1.rawValue }
}

let coinsSum = calculateCoins(coins: coinPurse)
print(coinsSum)


// 2
enum MonthExercise: Int {
    case january = 1, february, march,
         april, may, june, july, august,
         september, october, november, december
    
    var numberOfMonthsUntilSummer: Int {
        let numberOfSummerMonth = 7
        
        if self.rawValue <= 7 {
            return numberOfSummerMonth - self.rawValue
        } else {
            return self.rawValue - numberOfSummerMonth
        }
    }
}

let currentMonth = MonthExercise.january
currentMonth.numberOfMonthsUntilSummer

//: [Next](@next)
