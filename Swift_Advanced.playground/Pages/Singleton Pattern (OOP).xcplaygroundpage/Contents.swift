//: [Previous](@previous)

import Foundation

class AccountManager {
    
    static let sharedInstance = AccountManager()
    
    var userInfo = (ID: "rmznaze", Password: 994558310788)
    
    // Networking: communicating server
    func network() {
        
        // get everything
        
    }
    
    private init() { }
    
}

AccountManager.sharedInstance.userInfo
// (ID "rmznaze", Password 994558310788)

// ViewController One
AccountManager.sharedInstance.userInfo.ID // "rmznaze"

// ViewController Two
AccountManager.sharedInstance.userInfo.ID = "rmznift"

// ViewController Three
AccountManager.sharedInstance.userInfo.ID // "rmznift"



//: [Next](@next)
