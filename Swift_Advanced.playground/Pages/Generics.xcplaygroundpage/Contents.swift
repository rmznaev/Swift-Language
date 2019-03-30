//: [Previous](@previous)

import Foundation

let highSchoolGPA = [2.8, 3.2, 3.5, 3.8, 3.5]
let favoritePeople = ["Steve Jobs", "Thomas Edison", "Nicola Tesla"]
let favoriteNumbers = [3, 20]

//: Worst
highSchoolGPA[0]
highSchoolGPA[1]
highSchoolGPA[2]

//: Typical Solution
func printDoubleElement(array: [Double]) {
    for gpa in array {
        print(gpa)
    }
}

func printStringElement(array: [String]) {
    for person in favoritePeople {
        print("I love \(person)")
    }
}

func printNumberElement(array: [Int]) {
    for number in array {
        print("I like \(number)")
    }
}

printStringElement(array: favoritePeople)

//: Introducing Generics
func genericFunction<anything>(value: anything) {
    print(value)
}

genericFunction(value: "Ramazan")
genericFunction(value: 1994)

func genericFuncton<T>(value: T) {
    print(value)
}

func printElement<T>(array: [T]) {
    for element in array {
        print(element)
    }
}

printElement(array: highSchoolGPA)
print("\n")
printElement(array: favoriteNumbers)

//: Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define.


//: Structures Met Generics
struct Family {
    var members: [String] = []
    
    mutating func push(member: String) {
        members.append(member)
    }
}

var myFam = Family()
myFam.push(member: "Ramazan")
myFam.members


struct GenericFamily<T> {
    var members: [T] = []
    
    mutating func push(member: T) {
        members.append(member)
    }
}

//: Generic Initialization
// T Implicitly Defined
let myHappyFamily = GenericFamily(members: [1, 3, 5, 7, 9])

// T Explicitly Defined
var genericFamily = GenericFamily<Int>()
genericFamily.push(member: 77)
genericFamily.push(member: 17)


//: Generic Extension
extension GenericFamily {
    var firstElement: T? {
        if members.isEmpty {
            return nil
        } else {
            return members[0]
        }
    }
}

genericFamily.firstElement



//: Type Constraint
class LOL {}
class BabyLol: LOL {}

let example = LOL()

func addLOLClassOnly<T: LOL>(array: [T]) { }
addLOLClassOnly(array: [example, example])
//addLOLClassOnly(array: [1, 2, 4, 5])
addLOLClassOnly(array: [BabyLol() as LOL, BabyLol() as LOL])

//: [Next](@next)
