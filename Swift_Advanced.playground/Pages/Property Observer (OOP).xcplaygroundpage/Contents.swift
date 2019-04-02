//: [Previous](@previous)

import Foundation

//: willSet - is called just before the value is set
//: didSet  - is called immediately after the new value is set to the property

var myGrade: Int = 80 {
    
    willSet(newGrade) {
        
        print("About to change your grade to \(newGrade)")
        
    }
    
    didSet {
        
        print("Your grade has been changed")
        
        print("you had \(oldValue) previously. Now you have \(myGrade)")
        
    }
    
}

myGrade = 100

// "About to change your grade to 100"
// "Your grade has been changed"
// "You had 80 previously. Now you have 100"


//: Step Counter

var totalSteps: Int = 20 {
    
    willSet(newTotalSteps) {
        
        print("About to set totalSteps to \(newTotalSteps)")
        
    }
    
    didSet {
        
        if totalSteps > oldValue  {
            
            print("Added \(totalSteps - oldValue) steps")
            
        }
        
    }
    
}

totalSteps = 60

// "About to set totalSteps to 60"
// "Added 20 steps"



//: Real world application usage

var userLoginInfo: Bool = false {
    
    willSet(newValue) {
        
        print("The user has tried something")
        
    }
    didSet {
        
        if userLoginInfo {
            
            print("The user has switched from \(oldValue) to \(userLoginInfo)")
            
            // Backgroud color
            // Animation
            // Pop Up
            // All kinds of stuff
            
        }
        
    }
    
}

userLoginInfo = true

// The user has tried something
// The user has switched from false to true

userLoginInfo = true

// The user has tried something
// The user has switched from true to true


//: What makes Property Observers different
// 1 - There is a default value and it is observed rather than calculated
// 2 - willSet and didSet will not get called when you initialize it


//: [Next](@next)
