//: [Previous](@previous)

import Foundation
import SwiftUI


// - Concurrency

// Basic tasks
Task {
    print("Doing some work on a task")
}
print("Doing some work on the main actor")


// Changing the order
Task {
    print("Doing some work on a task")
    let sum = (1...100).reduce(0, +)
    print("1 + 2 + 3 ... 100 = \(sum)")
}
print("Doing some work on the main actor")


// Canceling a task
/// This requirement is a concurrency design pattern is known as cooperative cancellation.
let task = Task {
    print("Doing some work on a task")
    let sum = (1...100).reduce(0, +)
    try Task.checkCancellation()
    print("1 + 2 + 3 ... 100 = \(sum)")
}
print("Doing some work on the main actor")
task.cancel()


// Suspending a task
Task {
    print("Hello")
    ///Just as the try flags indicate that a function can fail, marking it with await
    ///recognizes that it can suspend and later resume execution, which is what sleep does.
    try await Task.sleep(nanoseconds: 1_000_000_000)
    print("Goodbye")
}


// Wrapping it in a function
/// Of course, it’s possible to have asynchronous functions that don’t throw and throwing functions that are synchronous.
func helloPauseGoodbye() async throws {
    print("Hello")
    try await Task.sleep(nanoseconds: 1_000_000_000)
    print("Goodbye")
}

//: [Next](@next)
