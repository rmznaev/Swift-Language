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

//: RULE - You may not have a stored property

//: [Next](@next)
