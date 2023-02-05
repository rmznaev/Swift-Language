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


// *******************************************************************


// - Swift Language Guide
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
/// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
/// someString is now "world", and anotherString is now "hello"


// Generic Types
struct IntStack {
    var items: [Int] = []

    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop(_ item: Int) {
        items.removeLast()
    }
}

struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
/// the stack now contains 4 strings

let fromTheTop = stackOfStrings.pop()
/// fromTheTop is equal to "cuatro", and the stack now contains 3 strings

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}
/// Prints "The top item on the stack is tres."


// Type Constraints
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
/// doubleIndex is an optional Int with no value, because 9.3 isn't in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
/// stringIndex is an optional Int containing a value of 2


// Associated Types
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    mutating func append(_ item: Item)
}

struct IntStackAgain: Container {
    /// original IntStack implementation
    var items: [Int] = []

    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop() -> Int {
        return items.removeLast()
    }

    /// conformance to the Container protocol
    typealias Item = Int

    var count: Int {
        return items.count
    }

    subscript(i: Int) -> Int {
        return items[i]
    }

    mutating func append(_ item: Int) {
        self.push(item)
    }
}

struct StackAgain<Element>: Container {
    /// original Stack<Element> implementation
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }

    /// conformance to the Container protocol
    var count: Int {
        return items.count
    }

    subscript(i: Int) -> Element {
        return items[i]
    }

    mutating func append(_ item: Element) {
        self.push(item)
    }
}


extension Array: Container {}


// Using a Protocol in Its Associated Type’s Constraints
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension StackAgain: SuffixableContainer {
    func suffix(_ size: Int) -> StackAgain {
        var result = StackAgain()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}

var stackOfInts = StackAgain<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)
/// suffix contains 20 and 30


extension IntStackAgain: SuffixableContainer {
    func suffix(_ size: Int) -> StackAgain<Int> {
        var result = StackAgain<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack<Int>.
}

//: [Next](@next)
