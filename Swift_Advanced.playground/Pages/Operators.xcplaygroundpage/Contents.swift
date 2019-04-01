//: [Previous](@previous)

import Foundation

//: Write less, produce more
//: Operator -> is a symbol for a function


// Unary operators
!true // false
!false // true


// Binary operators
1 + 2
4 == 4
1 / 4
5 % 2


// Ternary operator
//: Typical Else-If
var iCanDrink = true

if iCanDrink {
    print("You may enter")
} else {
    print("No no no")
}

// With Ternary
iCanDrink = false
iCanDrink ? print("You may enter") : print("No no no")

//: Add odd/even numbers
var evenNumbers: [Int] = []
var oddNumbers: [Int] = []

for number in 1...50 {
    
//    if number % 2 == 0 {
//        evenNumbers.append(number)
//    } else {
//        oddNumbers.append(number)
//    }
    
    // Use ternary way
    number % 2 == 0 ? evenNumbers.append(number) : oddNumbers.append(number)
}


//: Unwrapping optionals
var age: Int? = nil
var defaultAge: Int = 20
var finalUserAge = Int() // Int() also assigns 0 to the finalUserAge

if age != nil {
    finalUserAge = age!
} else {
    finalUserAge = defaultAge
}

//: Nil-coalescing Operator
finalUserAge = age ?? defaultAge


//: [Next](@next)
