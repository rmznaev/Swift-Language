//: [Previous](@previous)

import Foundation
import UIKit

//: Purpose of Delegate: Communicate/Pass Data between objects
// - Goal: Send data from FirstVC to SecondVC


//: Design Protocol
protocol PassDataDelegate {
    
    func passData(data: String)
    
}

//: Design Delegator (Sender)
class FirstVC {
    
    var delegate: PassDataDelegate?
    
}

FirstVC().delegate?.passData(data: "a bunch of contracts")


//: Design Delegate (Receiver)
class SecondVC: PassDataDelegate {
    
    func passData(data: String) {
        
        print("The CEO gave me \(data)")
        
        // UI Updates
        // Pop Up
        // Animation
        
    }
    
}

//" Create Objects
let firstVC = FirstVC()
let secondVC = SecondVC()

//: Assign Delegate
firstVC.delegate = secondVC
firstVC.delegate?.passData(data: "a bunch of contracts")


//: Practical Example in iOS
class BobViewController: UIViewController, UITableViewDelegate {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
        
        // Animation
        // Go to the next VC
        
    }
    
}

//: [Next](@next)
