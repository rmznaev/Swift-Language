//: [Previous](@previous)

import Foundation

class Vehicle {
    
    var description: String {
        
        return "Hello, I'm moving at 30km/hr"
        
    }
    
    func warning() {
        
        print("Be careful, I'm going pretty fast")
        
    }
    
}

//: Override Method and Property

class ToyCar: Vehicle {
    
    override var description: String {
        
        return super.description
        
    }
    
    override func warning() {
        
        print("Hello, please do not mind me.")
        
        super.warning()
        
    }
    
}

Vehicle().description

ToyCar().description

ToyCar().warning()


//: super.init

class Human {
    
    var origin: String
    
    init(enterOrigin: String) {
        
        origin = enterOrigin
        
    }
    
}

Human(enterOrigin: "Azerbaijan")

class Azerbaijanian: Human {
    
    var city: String
    
    init(enterCity: String) {
        
        self.city = enterCity
        super.init(enterOrigin: "Azerbaijanian")
        
    }
    
    init(enterCity: String, origin: String) {
        
        self.city = enterCity
        
        super.init(enterOrigin: origin)
        
    }
    
}

let rmzn = Azerbaijanian(enterCity: "Zaqatala")

rmzn.city

rmzn.origin

let ramazan = Azerbaijanian(enterCity: "Baku", origin: "Azerbaijan")


//: Override Init

class Tesla {
    
    var numberOfWheels: Int
    
    init(enterWheelNumber: Int) {
        
        numberOfWheels = enterWheelNumber
        
    }
    
}

class ModelS: Tesla {
    
    override init(enterWheelNumber: Int) {
        
        super.init(enterWheelNumber: enterWheelNumber)
        
        print("Wow, this is a beautiful car")
        
    }
    
}

ModelS(enterWheelNumber: 50)

//: [Next](@next)
