//: [Previous](@previous)

import Foundation

protocol MathGenius {
    
    func calculateGPA()
    
}

extension MathGenius {
    
    func calculateGPA() {
        
        print("I'm too cool for school")
        
    }
    
}

struct Rmzn: MathGenius {}

Rmzn().calculateGPA()


class Ramazan: MathGenius {
    
    func calculateGPA() {
        
        print("1.2 GPA")
        
    }
    
}

Ramazan().calculateGPA()


//: Practical Protocol Extension

protocol FindAriable {
    
    func calculateArea(side: Double, length: Double) -> String
    
}

extension FindAriable {
    
    func calculateArea(side: Double, length: Double) -> String {
        
        let area = String(side * length)
        
        return "The area is \(area)"
        
    }
    
}

struct Square: FindAriable {}

struct Hexagon: FindAriable {}

Square().calculateArea(side: 4, length: 7)

Hexagon().calculateArea(side: 6, length: 11)


//: Usage Case
//: 1. UILabel, UIImageView, UIView --> Animation
//: 2. Storyboard Identifier
//: 3. Reusable table and collection view cells

//: [Next](@next)
