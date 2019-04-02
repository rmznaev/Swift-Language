//: [Previous](@previous)

import Foundation

struct NuclearRocket {
    
    var meters: Double
    
    var liters: Double
    
    // Init for 🇦🇿
    init(meters: Double, liters: Double) {
        
        self.meters = meters
        
        self.liters = liters
        
    }
    
    // Init for 🇺🇸
    init(ft: Double, gallon: Double) {
        
        let convertedMeters = ft / 3.28
        
        let convertedLitters = gallon * 3.78
        
        self.init(meters: convertedMeters, liters: convertedLitters)
        
    }
    
}

// 🇦🇿 Scientist
var rocket = NuclearRocket(meters: 20, liters: 20)

print(rocket.liters)

print(rocket.meters)


// 🇺🇸 Scientist
var newRocket = NuclearRocket(ft: 300, gallon: 2)

print(newRocket.liters)

print(newRocket.meters)

//: [Next](@next)
