//: [Previous](@previous)

import Foundation

class AccountManager {
    
    static let sharedInstance = AccountManager()
    
    var userInfo = (ID: "bobthedev", Password: 01036343984)
    
    // Networking: communicating server
    func network() {
        
        // get everything
        
    }
    
    private init() { }
    
}

AccountManager.sharedInstance.userInfo
// (ID "bobthedev", Password 01036343984)

// ViewController One
AccountManager.sharedInstance.userInfo.ID // "bobthedev"

// ViewController Two
AccountManager.sharedInstance.userInfo.ID = "bobleesj"

// ViewController Three
AccountManager.sharedInstance.userInfo.ID // "bobleesj"



//: [Next](@next)
