//: [Previous](@previous)

import Foundation
import UIKit


let box: UIView = {
    
    let view = UIView()
    
    return view
    
}()

let buttonSize = CGRect(x: 0, y: 0, width: 100, height: 100)

// ViewControllerOne

let rmznButton = UIButton(frame: buttonSize)

rmznButton.backgroundColor = .black

rmznButton.titleLabel?.text = "Rmzn"

rmznButton.titleLabel?.textColor = .white

// ViewControllerTwo

let rmzniftButton = UIButton(frame: buttonSize)

rmzniftButton.backgroundColor = .black

rmzniftButton.titleLabel?.text = "Ramazan"

rmzniftButton.titleLabel?.textColor = .white


func createButton(enterTitle: String) -> UIButton {
    
    let button = UIButton(frame: buttonSize)
    
    button.backgroundColor = .black

    button.titleLabel?.text = enterTitle

    return button
    
}

createButton(enterTitle: "Qabaxin kate 🎃")


struct Human {
    
    init() {
        
        print("Born 1994")
        
    }
    
}

let createRmzn = { () -> Human in
    
    let human = Human()
    
    return human
    
}

let rmznInstance = createRmzn()

let rmznift = { () -> Human in
    
    let human = Human()
    
    return human
    
}()

let rmznView = { () -> UIView in
    
    let view = UIView()
    
    view.backgroundColor = .black
    
    return view
    
}()

let rmzniftView = { () -> UIView in
    
    let view = UIView()
    
    view.backgroundColor = .black
    
    return view
    
}()

let newrmznView: UIView = {
    
    let view = UIView()
    
    view.backgroundColor = .black
    
    return view
    
}()

class IntenseMathProblem {
    
    lazy var complexNumber: Int = {
        
        1 * 1
        
    }()
    
}

let problem = IntenseMathProblem() // no value for complexNumber

problem.complexNumber // now, complexnumber is 1

class SortFromDataBase {
    
    // Data
    
    lazy var sortNumberFromDatabase: [Int] = {
        
        // Caluation and sorting
        
        [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
    }()
    
}

// SortFromDataBase().sortNumberFromDatabase


class CompressionManager {
    
    lazy var compressedImage: UIImage = {
        
        let image = UIImage()
        
        // Compress the image
        
        // Logic
        
        return image
        
    }()
    
}

//: [Next](@next)
