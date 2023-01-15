//: [Previous](@previous)

import Foundation

// - Closures

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 < s2
})

reversedNames = names.sorted(by: {s1, s2 in return s1 < s2 })
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})
reversedNames = names.sorted(by: { $0 > $1 })
reversedNames = names.sorted(by: <)

// -------------

let nums = [5, 4, 1, 8, 7, 3]

func sortByAscendingOrder(_ n1: Int, _ n2: Int) -> Bool {
    return n1 < n2
}

let sortedNums = nums.sorted(by: sortByAscendingOrder)

let reversedNums = nums.sorted(by: { (n1: Int, n2: Int) -> Bool in
    return n1 < n2
})

nums.sorted(by: { (n1, n2) -> Bool in return n1 < n2 })

nums.sorted(by: { n1, n2 in return n1 < n2 })

nums.sorted(by: { n1, n2 in n1 < n2 })

nums.sorted(by: { $0 < $1 })

nums.sorted(by: <)


// Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

someFunctionThatTakesAClosure {
    //closure body goes here
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [ 16, 58, 510 ]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

struct Server { }
struct Picture { }

func loadPicture(
    from server: Server,
    completion: (Picture) -> Void,
    onFailure: () -> Void
){
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

func download(_ photo: String, from: Server) -> Picture? {
    return Picture()
}

loadPicture(from: Server()) { picture in
    // set picture to some place, because it successfully loaded
} onFailure: {
    // show some alert, because loading is failed
    print("Couldn't download the next picture.")
}

// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

makeIncrementer(forIncrement: 4)

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen() // 10
incrementByTen() // 20
incrementByTen() // 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven() // 7
incrementBySeven() // 14
incrementBySeven() // 21


// Escaping Closures
var completionHandlers: [() -> Void] = []

// function with @escaping closure
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// function witout @escaping closure
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x) // prints "200"

completionHandlers.first?()
print(instance.x) // prints "100"


// Autoclosures
var customersLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersLine.count) // 5

let customerProvider = { customersLine.remove(at: 0) }
print(customersLine.count) // 5

print("Now serving \(customerProvider())!") // Now serving Chris!
print(customersLine.count) // 4

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: customersLine.remove(at: 0))



// - More about Escaping Closures...
// Example one

let makeGreeting: (String) -> String = { name in
    return "Hello \(name)!"
}

print(makeGreeting("Rmzn"))

class TaskManager {
    var onTaskFinished:(() -> Void)?

    func startLengthyTask(completionHandler: @escaping () -> Void) {
        // Store completion handler for later
        onTaskFinished = completionHandler

        // Do lengthy task
        // …
    }

    func onLengthyTaskFinished() {
        onTaskFinished?() // Call completion handler
    }
}

let task = TaskManager()
task.startLengthyTask(completionHandler: {
    // Do this when task has finished…
})


// Example two

func getData(completion: @escaping (Bool) -> Void) {
    let task = URLSession.shared.dataTask(with: URL(string: "")!) { data, response, error in
        guard data != nil else {
            completion(false)
            return
        }
        completion(true)
    }
    task.resume()
}

final class APICaller {
    var isReady = false
    var completionHandlers = [(() -> Void)]()
    
    func warmUp() {
        isReady = true
        
        if !completionHandlers.isEmpty {
            completionHandlers.forEach { $0() }
            completionHandlers.removeAll()
        }
    }
    
    func doSomething(completion: @escaping (() -> Void)) {
        guard isReady else {
            completionHandlers.append { completion() }
            return
        }
        completion()
    }
}

APICaller().doSomething {
    // closure body goes here
}

// - More about @autoclosures...
// - Example one

struct Person: CustomStringConvertible {
    let name: String
    
    var description: String {
        print("Asking for Person description.")
        return "Person name is \(name)"
    }
}

let isDebuggingEnabled = false
 
func debugLog(_ message: @autoclosure () -> String) {
    /// You could replace this in projects with #if DEBUG
    if isDebuggingEnabled {
        print("[DEBUG] \(message())")
    }
}

let person = Person(name: "Bernie")
debugLog({ person.description }())


// - Swift Apprientice book

var multiplyClosure = { (a: Int, b: Int) -> Int in
  return a * b
}

multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

multiplyClosure = { (a, b) in
    a * b
}

multiplyClosure = {
    $0 * $1
}

let result = multiplyClosure(4, 2)

func operateOnNumbers(
    _ a: Int,
    _ b: Int,
    operation: (Int, Int) -> Int
) -> Int {
  let result = operation(a, b)
  print(result)
  return result
}

let addClosure = { (a: Int, b: Int) in
  a + b
}

operateOnNumbers(4, 2, operation: addClosure)

func addFunction(_ a: Int, _ b: Int) -> Int {
  a + b
}

operateOnNumbers(4, 2, operation: addFunction)

operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
  return a + b
})

operateOnNumbers(4, 2, operation: { $0 + $1 })

operateOnNumbers(4, 2) {
  $0 + $1
}


// Closures with no return value

///closure that takes no parameters and returns nothing
let voidClosure: () -> Void = {
    print("Swift is awesome!")
}

voidClosure()

var counter = 0
let incrementCounter = {
    counter += 1
}

incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()
incrementCounter()

print(counter)

func countingClosure() -> () -> Int {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}

let counterOne = countingClosure()
let counterTwo = countingClosure()

counterOne()
counterOne()

counterTwo()
counterTwo()
counterTwo()

let alphabets = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
alphabets.sorted() // ["A", "BB", "CCCC", "EEEEE", "ZZZZZZ"]

alphabets.sorted {
    $0.count > $1.count // ["ZZZZZZ", "EEEEE", "CCCC", "BB", "A"]
}


// Functional Programming features :-)

// .forEach { }
// .filter { }
// .first { }
// .map { }
// .compactMap { }
// .flatMap { }
// .reduce { }
// .reduce(into:_:) { }
// .dropFirst()
// .dropLast()
// .prefix()
// .suffix()
// .removeAll { }
// .removeAll()

let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}

var prices = [1.5, 10, 4.99, 2.30, 8.19]

let largePrices = prices.filter {
    $0 > 5
}
print(largePrices)

let firstLargePrice = prices.first {
    $0 > 5
}
print(firstLargePrice ?? 0.0)

let salePrices = prices.map {
    $0 * 0.9
}
print(salePrices)

let userInput = ["0", "11", "haha", "42"]

let userInputNumbers = userInput.map {
    Int($0)
}
print(userInputNumbers)

let userInputNumbersOnly = userInput.compactMap {
    Int($0)
}
print(userInputNumbersOnly)

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]

let allUserInput = userInputNested.flatMap {
    $0
}
print(allUserInput)

let sum = prices.reduce(0) {
    $0 + $1
}
print(sum)

let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]

let stockSum = stock.reduce(0) {
    $0 + $1.key * Double($1.value)
}
print(stockSum)

let removeFirst = prices.dropFirst()
let removeFirstTwo = prices.dropFirst(2)

let removeLast = prices.dropLast()
let removeLastTwo = prices.dropLast(2)

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)

prices.removeAll() { $0 > 2 } // prices is now [1.5]
prices.removeAll() // prices is now an empty array


// Lazy collections

func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 || number == 3 { return true }

    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 { return false }
    }

    return true
}

let primes = (1...).lazy
    .filter { isPrime($0) }
    .prefix(10)
primes.forEach { print($0) }


//: [Next](@next)
