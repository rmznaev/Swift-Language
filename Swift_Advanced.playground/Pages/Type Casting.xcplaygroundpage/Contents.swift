//: [Previous](@previous)

import Foundation
import UIKit

//: 1 - Distinguish between as?, as!, and as
//: 2 - Why does Xcode telling me what to do?

//: Design Class
class Human {
    func introduce() {
        print("Hi, I'm a human")
    }
}

//: Design Subclass
class Azerbaijanian: Human {
    func singMugam() {
        print("""
            Konlumun sevgili mehbubu menim,
            Vetenimdir, vetenimdir, vetenim.
            """)
    }
}

let rmzn = Azerbaijanian()
rmzn.introduce()
rmzn.singMugam()


//: Type Casting
let newRmzn = rmzn as Human
newRmzn.introduce() // upcasting

//: > as --> Upcasting (Always Works)

class Turkish: Human {
    func eatTurkishDelight() {
        print("Mmmmmm......")
    }
}

//: Upcasting with Normal/Common Types
var name = "Ramazan" as Any
var number = 24 as Any

var anyArray = [name, number]
// Downcating only occurs after upcasting
// Downcasting --> specific

//: ###Downcasting
//: Explicit/Force Downcasting
let newValue = anyArray[1] as! Int // normal type
// let anotherValue = anyArray[1] as! String // can't do like this

//: Implicit Downcasting (Safe)
let newNewValue = anyArray[0] as? Int
let newNewNewValue = anyArray[1] as? Int

//: Grouping
let asif = Azerbaijanian()
let cuneyt = Turkish()
let sahil = Azerbaijanian()
let emre = Turkish()

//let humans: [Human] = [asif as Human, cuneyt as Human, sahil as Human, emre as Human]

// As long as your humans share the same parent you can do like this
let humans: [Human] = [asif, cuneyt, sahil, emre]
humans[0].introduce()

for human in humans {
    if let azerbaijanian = human as? Azerbaijanian {
        azerbaijanian.singMugam()
    }
    
    if let turkish = human as? Turkish {
        turkish.eatTurkishDelight()
    }
}

//: Practical Type Casting
let loginButton = UIButton()
let loginMessage = UILabel()
let loginView = UIView()

let UIComponents = [loginButton, loginMessage, loginView]

for component in UIComponents {
    if let button = component as? UIButton {
        button.backgroundColor = .white
        // Code here
    }
    
    if let label = component as? UILabel {
        label.backgroundColor = .yellow
        print(label)
        // Code here
    }

    let view = component as UIView
    view.backgroundColor = .blue
}


//: Type Casting in UIKit
//let storyboard = UIStoryboard(name: "Main", bundle: nil)
//let vc = storyboard.instantiateViewController(withIdentifier: "VC")

//: [Next](@next)
