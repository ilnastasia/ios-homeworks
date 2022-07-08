
import Foundation
import UIKit

protocol UserService {
    func userHandler(name: String) -> User?
}

class User {
    var fullName: String
    var avatar: UIImage
    var status: String
    
    init(fullName: String, avatar: UIImage, status: String) {
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

class CurrentUserService: UserService {
    var user: User
    
    init(user: User) {
        self.user = user
        
    }
    
    func userHandler(name: String) -> User? {
        if user.fullName == name {
            return user
        } else {
            return nil
        }
    }
}
