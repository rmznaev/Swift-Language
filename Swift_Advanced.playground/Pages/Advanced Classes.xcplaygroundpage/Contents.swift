//: [Previous](@previous)

import Foundation

// - Advanced Classes

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    /// This is an example of an override, which we’ll cover soon.
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

let john = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

john.firstName // "John"
jane.firstName // "Jane"

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)
// john.recordGrade(history) // john is not a student!

func phonebookName(_ person: Person) -> String {
    "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "Johnny", lastName: "Appleseed")
let oboePlayer = OboePlayer(firstName: "Jane", lastName: "Appleseed")

phonebookName(person) // Appleseed, Johnny
phonebookName(oboePlayer) // Appleseed, Jane


var hallMonitor = Student(firstName: "Jill", lastName: "Bananapeel")
hallMonitor = oboePlayer

oboePlayer as Student
//(oboePlayer as Student).minimumPracticeTime // ERROR: No longer a band member!

hallMonitor as? BandMember
(hallMonitor as? BandMember)?.minimumPracticeTime // 4 (optional)

hallMonitor as! BandMember // Careful! Failure would lead to a runtime crash.
(hallMonitor as! BandMember).minimumPracticeTime // 4 (force unwrapped)

if let hallMonitor = hallMonitor as? BandMember {
    print("""
          This hall monitor is a band member and practices
          at least \(hallMonitor.minimumPracticeTime) hours per week.
          """)
}

func afterClassActivity(for student: Student) -> String {
    "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
    "Goes to practice!"
}

afterClassActivity(for: oboePlayer) // Goes to practice!
afterClassActivity(for: oboePlayer as Student) // Goes home!


// Inheritance, methods and overrides
class StudentAthlete: Student {
    var sports: [String]
    var isEligible: Bool = false
    var failedClasses: [Grade] = []
    
    init(sports: [String], firstName: String, lastName: String) {
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    }

    override func recordGrade(_ grade: Grade) {
        var newFailedClasses: [Grade] = []
        for grade in grades {
            if grade.letter == "F" {
                newFailedClasses.append(grade)
            }
        }
        failedClasses = newFailedClasses

        super.recordGrade(grade)
    }
}


// Required and convenience initializers
class StudentAgain {
  let firstName: String
  let lastName: String
  var grades: [Grade] = []

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

  init(transfer: StudentAgain) {
    self.firstName = transfer.firstName
    self.lastName = transfer.lastName
  }

  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
}


class Team {
    var players: [StudentAthlete] = []

    var isEligible: Bool {
    for player in players {
        if !player.isEligible {
            return false
        }
    }
    return true
    }
}

//: [Next](@next)
