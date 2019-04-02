//: [Previous](@previous)

import Foundation

//: Can initialization fail?


// Error handlig (Review)

enum NameError: Error {
    
    case noName
    
}

struct UdemyCourse {
    
    let courseName: String
    
    init(name: String) throws {
        
        if name.isEmpty {
            
            throw NameError.noName
            
        }
        
        self.courseName = name
        
    }
    
}

do {
    
    let myCourse = try UdemyCourse(name: "Rmzn")
    
    myCourse.courseName
    
} catch NameError.noName {
    
    print("Ramazan, please enter the name")
    
}


//: Design Failable Init

class Blog {
    
    let name: String
    
    init?(name: String) { // ? makes initialization failable
        
        if name.isEmpty {
            
            return nil
            
        }
        
        self.name = name
        
    }
    
}

let rmzn = Blog(name: "Ramazan")

let realRmzn = rmzn!



//: [Next](@next)
