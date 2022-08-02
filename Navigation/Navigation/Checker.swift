
import Foundation

class Checker {
    
    static let shared = Checker()
    
    private init() {}
    
    private let log = "login"
    private let pswd = "password"
    
    
    func loginPasswordCheck (login: String, password: String) -> Bool {
        if login == log && password == pswd {
            return true
        } else {
            return false
        }
    }
}
