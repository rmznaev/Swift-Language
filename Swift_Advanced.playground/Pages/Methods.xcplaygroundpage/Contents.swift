//: [Previous](@previous)

import Foundation

// - Methods

// Instance methods
class Counter {
    var count = 0

    func increment() {
        count += 1
    }

    func increment(by amount: Int) {
        count += amount
    }

    func reset() {
        count = 0
    }
}

struct Point {
    var x = 0.0
    var y = 0.0

    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }

    mutating func moveBy(
        x deltaX: Double,
        y deltaY: Double
    ) {
        x += deltaX
        y += deltaY
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
} /// Prints "This point is to the right of the line where x == 1.0"

var somePointAgain = Point(x: 1.0, y: 1.0)
somePointAgain.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePointAgain.x), \(somePointAgain.y))") /// Prints "The point is now at (3.0, 4.0)"


// Assigning to self Within a Mutating Method
struct PointAgain {
    var x = 0.0
    var y = 0.0

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
/// ovenLight is now equal to .high
ovenLight.next()
/// ovenLight is now equal to .off


// Type methods
class SomeClass {
    class func someTypeMethod() {
        print("someTypeMethod() called")
        // type method implementation goes here
    }
}

SomeClass.someTypeMethod()


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String

    init(name: String) {
        playerName = name
    }

    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)") /// Prints "highest unlocked level is now 2"

print("First player: \(player.playerName)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 hasn't yet been unlocked")
}
// Prints "level 6 hasn't yet been unlocked"

print("Second player: \(player.playerName)")

//: [Next](@next)
