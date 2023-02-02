//: [Previous](@previous)

import Foundation

//: Keep the code short and modularized
//: Prevent anything massive

// Design a Class
struct Rmzn {
    var name = "Ramazan"
    var skill = "coding"
    
    init() { }
}

Rmzn().name // "Rmzn"

extension Rmzn {
    var description: String {
        let myName = self.name
        let mySkill = self.skill
        
        return "I'm \(myName). I know \(mySkill)"
    }
    
    init(enterSkill: String) {
        self.skill = enterSkill
        print("You have entered a cool skill")
    }
    
    subscript(mySkill: String) -> String {
        return "This is your secret weapon"
    }
}

let rmzn = Rmzn()
rmzn.description
print(rmzn.description)

let rmznOne = Rmzn(enterSkill: "Swift 5")
rmznOne.description
print(rmznOne.description)

rmznOne["iOS 12"]

//: Extension to Swift Types
let number = Int(777)

extension Int {
    var squared: Int {
        return self * self
    }
}

let answer = 4.squared
print(answer)

// *************************************************************************

// - Swift Language Guide

// Computed Properties
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
/// Prints "One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
/// Prints "Three feet is 0.914399970739201 meters"

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
/// Prints "A marathon is 42195.0 meters long"


// Initializers
struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Rect {
    var size = Size()
    var origin = Point()
}

let defaultRect = Rect()
let memberwiseRect = Rect(size: Size(width: 5.0, height: 5.0),
                          origin: Point(x: 2.0, y: 2.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(size: size, origin: Point(x: originX, y: originY))
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
/// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)


// Methods
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Yeeee")
}


// Mutating Instance Methods
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()
print(someInt.square())


// Subscripts
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
/// returns 5
746381295[1]
/// returns 9
746381295[2]
/// returns 2
746381295[8]
/// returns 7

746381295[9]
/// returns 0, as if you had requested:
0746381295[9]


//: [Next](@next)
