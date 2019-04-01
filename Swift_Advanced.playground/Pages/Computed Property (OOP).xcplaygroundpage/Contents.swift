//: [Previous](@previous)

import Foundation

//: We do not need to make functions to calculate something


// Traditional way :]

func getDiameter(radius: Double) -> Double {
    
    return radius * 2
    
}

func getRadius(diameter: Double) -> Double {
    
    return diameter / 2
    
}

getDiameter(radius: 10)  // return 20

getRadius(diameter: 200) // return 100

getRadius(diameter: 600) // return 300


// computed = calculated


//: Gettable Property

class NumberClass {
    
    var readableNumber: Double {
    
        get {
            
            return 777
            
        }
        
    }
    
    var readableNumbers: Double {
        
        return 789
        
    }
    
}

NumberClass().readableNumber



//: Settable Property

var radius: Double = 10

var diameter: Double {
    
    get {
        
        return radius * 2
        
    }
    
    set {
        
        radius = newValue / 2
        
    }
    
}

print(diameter)

diameter = 30

print(radius)

diameter = 50

print(radius)


//: Finding Area

var side: Double = 4

var area: Double {
    
    get {
        
        return side * side
        
    }
    
    set {
        
        side = sqrt(newValue)
        
    }
    
}

print(area)

area = 9

print(side)


// 1 - Grabbing and storing data the server // unchageable
// 2 - Propagating relationships between properties
// 3 - Preventing others from manipulating your code

//: [Next](@next)
