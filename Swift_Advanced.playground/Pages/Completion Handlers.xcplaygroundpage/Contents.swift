//: [Previous](@previous)

import Foundation

import UIKit

//: Completion Handler Used?

//: 1. Notify the download has been completed

//: 2. Animation

//: Practical UIKit Example


let firstVC = UIViewController()

let nextVC = UIViewController()


firstVC.present(nextVC, animated: true, completion: nil)

firstVC.present(nextVC, animated: true, completion: { () in
    
    print("Done")
    
})

firstVC.present(nextVC, animated: true, completion: { print("Done") })

firstVC.present(nextVC, animated: true) { print("Done") }

//: Design Handler Block

let myHandlerBlock: (Bool) -> () = { (isSuccess) in
    
    if isSuccess {
        
        print("Download has been done")
        
    }
    
}

let handlerBlock: (Bool) -> () = {
    
    if $0 {
        
        print("Download has been done")
        
        // Animation
        // Pop
        
    }
    
}

myHandlerBlock(true)

//: Design Function

func downloadAnImage(completionBlock: (Bool) -> Void) {
    
    for _ in 1...100 {
        
        print("Downloading")
        
    }
    
    completionBlock(true)
    
}

//: Pass Closure Indirectly

downloadAnImage(completionBlock: handlerBlock)

//: Pass Closure Directly

downloadAnImage(completionBlock: { (isSuccess) in
    
    if isSuccess {
        
        print("Done")
        
    }
    
})

downloadAnImage(completionBlock: {
    
    if $0 {
        
        print("Download has been done")
        
        // Animation
        // Pop
        
    }
    
})


//: Another Example

let handler: ([String]) -> Void = { (array) in
    
    print("Done working, \(array)")
    
    // Compress the image
    // Add color
    // Resize
    
}


func workSuperHard(doneStuffBlock: ([String]) -> Void) {
    
    for _ in 1...100 {
        
        print("But you gotta put in 🔨, 🔨, 🔨")
        
        // download
        
    }
    
    doneStuffBlock(["image1", "image2", "image3", "image4"])
    
}


//: Enter Closure Indirectly

workSuperHard(doneStuffBlock: handler)


//: Enter Closure Directly

workSuperHard(doneStuffBlock: { (images: [String]) in
    
    print("Done working, \(images)")
    
    // Compress the image
    // Add color
    // Resize
    
})





























//: [Next](@next)
