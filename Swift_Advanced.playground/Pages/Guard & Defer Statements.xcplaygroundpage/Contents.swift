//: [Previous](@previous)

import Foundation

// Is there any alternative to write an if-else statement?
// How do safety unwrap multiple optionals?

func checkDrinkingAge() {
    let canDrink = true
    
    if canDrink {
        print("You may enter")
        
        //More Code here
        
    } else {
        
        // More Code here
        
    }
}

let iCanDrunk = true

func checkDrinkingAges() {
    
    guard iCanDrunk else {
        // iCanDrink == false
        // iCanDrink == true // simply ignore the guard block
        print("You cannot drink, let me take you to the jail!")
        return
    }
    
    print("Enjoy your night!")
    
}

checkDrinkingAges()


//: ### Unwrapping Optionals
var publicName: String? = "Rmzn Abd"
var publicPhoto: String? = "Rmzn's Face"
var publicAge: Int? = nil

//: The worst nightmare
func unwrapOneByOne() {
    if let name = publicName {
        if let photo = publicPhoto {
            if let age = publicAge {
                print("Bob: \(name), \(photo), \(age)")
            } else {
                print("age is missing")
            }
        } else {
            print("photo is missing")
        }
    } else {
        print("name is missing")
    }
}

unwrapOneByOne()

//: Slightly Better
func unwrapBetter() {
    if let name = publicName {
        print(name)
    } else {
        print("No name")
        return
    }
    
    if let photo = publicPhoto {
        print(photo)
    } else {
        print("No photo")
        return
    }
    
    if let age = publicAge {
        print(age)
    } else {
        print("No age")
        return
    }
}

//: Introducing guard statement
func unwrapOneByOneWithGuard() {
    guard let name = publicName else {
        // If publicName is non-nil, then ignore the block
        // If publicName is nil, run the guard block
        print("Name is missing")
        return
    }
    
    guard let photo = publicPhoto else {
        print("Photo is missing")
        return
    }
    
    guard let age = publicAge else {
        print("Age is missing")
        return
    }
    
    print(name)
    print(photo)
    print(age)
}

//: Unwrap multiple optionals with 'else-if'
func unwrap() {
    if let name = publicName, let photo = publicPhoto, let age = publicAge {
        print("Your name is \(name). I see your face right here, \(photo), you are \(age)")
    } else {
        print("Something is missing!")
    }
}

unwrap()

//: Unwrap multiple optionals with guard
func unwrapWithGuard() {
    guard let name = publicName, let photo = publicPhoto, let age = publicAge else {
        print("Something is missing!")
        return
    }
    
    print(name)
    print(photo)
    print(age)
}


// DEFER - Put of (action or event) to a later time

func simpleDefer() {
    
    defer {
        print("Chill, later")
    }
    
    print("Print First")
}

simpleDefer()

for i in 1...3 {
    defer { print("Deferred \(i)") }
    print("First \(i)")
}

//: [Next](@next)
