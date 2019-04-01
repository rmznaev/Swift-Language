//: [Previous](@previous)

import Foundation
import UIKit

class Human {
    
    var name: String
    
    init(name: String) {
        
        self.name = name
        
    }
    
    // Convenience init initializes the designated init mehtod
    
    convenience init() {
        
        self.init(name: "Ramazan Abdullayev")
        
    }
    
}

let rmznOne = Human(name: "Ramazan")

print(rmznOne.name)

let rmznTwo = Human()

print(rmznTwo.name)


//: Real life situation

let randomColor = UIColor(red: 10/255, green: 200/255, blue: 76/255, alpha: 1)

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
        
    }
    
}

let myFavoriteColor = UIColor(r: 80, g: 85, b: 255)


// Useful for quick initialization for open source projects
// Custom convenience like UIKit

//: [Next](@next)
