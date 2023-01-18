//: [Previous](@previous)

import Foundation

// - Classes
/// While you’ll often use structures in your apps to represent values, you’ll generally use classes to represent objects.

// UIView is the iOS main UI class, can be considered as a class

class Person {
    // properties
    var name: String
    var age: Int?
    var gender: String?
    var color: String?
    var martialStatus: String?
    
    // initialization
    init(name: String, age: Int?, gender: String?, color: String?, martialStatus: String?) {
        self.name = name
        self.age = age
        self.gender = gender
        self.color = color
        self.martialStatus = martialStatus
    }
    
    // methods
    func play(sport: String) {
        print("\(name) is playing now!")
    }
}

// object
let man = Person(name: "Ramazan", age: 25, gender: "male", color: "white", martialStatus: nil) // created an object of Person

class Driver: Person {
    // properties
    let id: Int
    let license: Bool
    let category: String?
    
    // initializations
    init(name: String, age: Int?, gender: String?, color: String?, martialStatus: String?, id: Int, license: Bool, category: String?) {
        self.id = id
        self.license = license
        self.category = category
        super.init(name: name, age: age, gender: gender, color: color, martialStatus: martialStatus)
    }
    
    // private method (encapsulation)
    private func isEligible() -> Bool {
        return license == true
    }
    
    // abstraction method
    func displayDriver() {
        if isEligible() {
            print("Driver \(name) with id \(id) is eligible to drive with \(category ?? "no category") category")
        } else {
            print("Driver \(name) is not eligible to drive!")
        }
    }
}

let driverOne = Driver(name: "Asif", age: 27, gender: "male", color: "white", martialStatus: nil, id: 20463, license: true, category: "BC")
let driverTwo = Driver(name: "Fariz", age: 26, gender: "male", color: "white", martialStatus: nil, id: 27635, license: false, category: nil)

driverOne.displayDriver()
driverTwo.displayDriver()

class Math {
    // properties
    let a: Int
    let b: Int
    
    // encapsulation
    private var result: Int?
    
    // initialization
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
    
    // methods
    func add() {
        self.result = a + b
    }
    
    func displayResult() {
        if let res = result {
            print("Result: \(res)")
        } else {
            print("No result!")
        }
    }
}

// object
let calculation = Math(a: 3, b: 4)

calculation.add()
calculation.displayResult()


class Player {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func play() {}
}

class Batsman: Player {
    override func play() {
        bat()
    }
    
    private func bat() {
        print("\(name) is batting...")
    }
}

class Bowler: Player {
    override func play() {
        bowl()
    }
    
    private func bowl() {
        print("\(name) is bowling")
    }
}

class CricketTeam {
    let name: String
    let team: [Player]
    
    init(name: String, team: [Player]) {
        self.name = name
        self.team = team
    }
    
    func play() {
        team.forEach { $0.play() }
    }
}

let playerOne = Batsman(name: "Asif")
let playerTwo = Bowler(name: "Fariz")

let talaTeam = CricketTeam(name: "Tala", team: [playerOne, playerTwo])
talaTeam.play()



// - Swift Apprentice Book samples below ⤵️

class Human {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let john = Human(firstName: "Johnny", lastName: "Appleseed")


class SimplePerson {
    let name: String

    init(name: String) {
        self.name = name
    }
}

var var1 = SimplePerson(name: "John")


// Methods and mutability

struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var credits = 0.0
    var grades: [Grade] = []

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func recordGrade(_ grade: Grade) {
        grades.append(grade)
        credits += grade.credits
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)

print(jane.credits)

math = Grade(letter: "A", points: 20.0, credits: 5.0)
jane.recordGrade(math)

print(jane.credits) // 12, not 8!

//: [Next](@next)
