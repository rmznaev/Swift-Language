//: [Previous](@previous)

import Foundation

//: Function = Global Closure

var addWithClosures = { (numOne: Int, numTwo: Int) in
    
    return numOne + numTwo
    
}

var returnString: () -> String = { () in
    
    "hello"
    
}


//: Return Closure

//: Return Closure indirectly

func returnClosure() -> ((Int, Int) -> Int) {
    
    return addWithClosures
    
}

let returnedClosure = returnClosure()

returnedClosure(4, 9)

returnClosure()(7, 11)


//: Return Closure Directly

func returnClosureDirectly() -> ((Int, Int) -> Int) {
    
    return { (numOne, numTwo) in numOne + numTwo }
    
}

let closure = returnClosureDirectly()

closure(7, 9)


// Simpler way

func returnClosureDirectlyTwo() -> ((Int, Int) -> Int) {
    
    return { $0 + $1 }
    
}

let closureTwo = returnClosureDirectlyTwo()

closureTwo(6, 9)


//: ### Pass Closure

func insertClosureBlock(closureBlock: () -> String) -> String {
    
//    var closure: () -> String = { () in closureBlock }
    
    return closureBlock()
    
}

//: Pass Closure Indirectly

let returnValue = insertClosureBlock(closureBlock: returnString)

print(returnValue)


//: Pass Closure Directly

insertClosureBlock(closureBlock: { "hello" })



//: Eample ->

let example = Array(1...100).filter { $0 % 2 == 0 } // Just Awesome

print(example)

//: [Next](@next)
