//: [Previous](@previous)

import Foundation
import UIKit

//: 1 - Distinguish between as?, as!, and as
//: 2 - Why does Xcode telling me what to do?

//: Design Class
class Human {
    func introduce() {
        print("Hi, I'm a human")
    }
}

//: Design Subclass
class Azerbaijanian: Human {
    func singMugam() {
        print("""
            Konlumun sevgili mehbubu menim,
            Vetenimdir, vetenimdir, vetenim.
            """)
    }
}

let rmzn = Azerbaijanian()
rmzn.introduce()
rmzn.singMugam()


//: Type Casting
let newRmzn = rmzn as Human
newRmzn.introduce() // upcasting

//: > as --> Upcasting (Always Works)

class Turkish: Human {
    func eatTurkishDelight() {
        print("Mmmmmm......")
    }
}

//: Upcasting with Normal/Common Types
var name = "Ramazan" as Any
var number = 24 as Any

var anyArray = [name, number]
// Downcating only occurs after upcasting
// Downcasting --> specific

//: ###Downcasting
//: Explicit/Force Downcasting
let newValue = anyArray[1] as! Int // normal type
// let anotherValue = anyArray[1] as! String // can't do like this

//: Implicit Downcasting (Safe)
let newNewValue = anyArray[0] as? Int
let newNewNewValue = anyArray[1] as? Int

//: Grouping
let asif = Azerbaijanian()
let cuneyt = Turkish()
let sahil = Azerbaijanian()
let emre = Turkish()

//let humans: [Human] = [asif as Human, cuneyt as Human, sahil as Human, emre as Human]

// As long as your humans share the same parent you can do like this
let humans: [Human] = [asif, cuneyt, sahil, emre]
humans[0].introduce()

for human in humans {
    if let azerbaijanian = human as? Azerbaijanian {
        azerbaijanian.singMugam()
    }
    
    if let turkish = human as? Turkish {
        turkish.eatTurkishDelight()
    }
}

//: Practical Type Casting
let loginButton = UIButton()
let loginMessage = UILabel()
let loginView = UIView()

let UIComponents = [loginButton, loginMessage, loginView]

for component in UIComponents {
    if let button = component as? UIButton {
        button.backgroundColor = .white
        // Code here
    }
    
    if let label = component as? UILabel {
        label.backgroundColor = .yellow
        print(label)
        // Code here
    }

    let view = component as UIView
    view.backgroundColor = .blue
}



// - Swift Language Guide


// Defining a Class Hierarchy for Type Casting
class MediaItem {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String

    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String

    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
/// the type of "library" is inferred to be [MediaItem]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
/// Prints "Media library contains 2 movies and 3 songs"


// Downcasting
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

/// Movie: Casablanca, dir. Michael Curtiz
/// Song: Blue Suede Shoes, by Elvis Presley
/// Movie: Citizen Kane, dir. Orson Welles
/// Song: The One And Only, by Chesney Hawkes
/// Song: Never Gonna Give You Up, by Rick Astley


// Type Casting for Any and AnyObject
var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

/// zero as an Int
/// zero as a Double
/// an integer value of 42
/// a positive double value of 3.14159
/// a string value of "hello"
/// an (x, y) point at 3.0, 5.0
/// a movie called Ghostbusters, dir. Ivan Reitman
/// Hello, Michael

let optionalNumber: Int? = 3
//things.append(optionalNumber)         // Warning
things.append(optionalNumber as Any)    // No warning

//: [Next](@next)
