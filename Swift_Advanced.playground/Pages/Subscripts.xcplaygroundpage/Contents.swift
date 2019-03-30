//: [Previous](@previous)

import Foundation

//: When I create an object, I want a shortcut without calling a method
struct HelloKitty {
    func saySomething() -> String {
        return "I'm Cute"
    }
}

HelloKitty().saySomething()

//: Introducing Subscripts
struct WeekDays {
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    subscript(index: Int) -> String {
        return days[index]
    }
}

let myDays = WeekDays()
myDays[1] // "Tuesday"
WeekDays().days[1]


//: Dictionary Type
var info = ["Height": 183, "Body Fat": 12.5, "Weight": 76]
let height = info["Height"]!

struct HealthInfo {
    var info = ["Height": 185, "Body Fat": 12.5, "Weight": 76]
    
    subscript(key: String) -> Double {
        if let newInfo = info[key] {
            return newInfo
        } else {
            return 0
        }
    }
}

let rmznInfo = HealthInfo()
let myHeight = rmznInfo["Footsize"]
let realheight = rmznInfo["Height"]

//: Usage Case:
//: 1 - Get the number of rows in table/collection
//: 2 - Anything has to do with pair and value


//: Shortcoming of Subscript
// No Context = ☠️



//: [Next](@next)
