//: [Previous](@previous)

import Foundation

// * A closure is a function without name and the func keyword
// * Quick and easy to carry around as a variable/constant or just pass as a parameter


// - Functions add two Ints

func addTwoNumbers(numOne: Int, numTwo: Int) -> Int {
    
    return numOne + numTwo
    
}

addTwoNumbers(numOne: 30, numTwo: 30)

var addFunction = addTwoNumbers

addFunction(20, 10)



// - Closure way One -

var addClosure: (Int, Int) -> Int = { (numOne: Int, numTwo: Int) in
    
    return numOne + numTwo
    
}

addClosure(7, 3)


// - Closure way Two -

var addClosureTwo = { (numOne: Int, numTwo: Int) in
    
    return numOne + numTwo
    
}

addClosureTwo(7, 9)


// - Closure way Three -

var addClosureThree = { (numOne: Int, numTwo: Int) in
    
    numOne + numTwo
    
}

addClosureThree(4, 7)


// - Closure way Four -

var addClosureFour: (Int, Int) -> Int = { $0 + $1 }

addClosureFour(9, 11)



//: Example with () -> String

// Function way
func callString() -> String {
    
    return "Hello, I'm a string :]"
    
}

callString()

//Closure way
var callStringClosure = {"Hello, I'm a string"}

callStringClosure()


//: [Next](@next)
