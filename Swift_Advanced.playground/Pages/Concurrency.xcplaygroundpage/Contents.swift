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


// Decoding an API — learning domains
struct Domains: Decodable {
  let data: [Domain]
}

struct Attributes: Decodable {
    let name: String
    let description: String
    let level: String
}

struct Domain: Decodable {
    let attributes: Attributes
}

// Async/await in action
func fetchDomains() async throws -> [Domain] {
    let url = URL(string: "https://api.raywenderlich.com/api/domains")!
    let (data, _) = try await URLSession.shared.data(from: url)
    
    return try JSONDecoder().decode(Domains.self, from: data).data
}

Task {
    do {
        let domains = try await fetchDomains()
        
        for domain in domains {
            let attribute = domain.attributes
            print("\(attribute.name): \(attribute.description) - \(attribute.level)")
        }
    } catch {
        print(error)
    }
}

//: [Next](@next)
