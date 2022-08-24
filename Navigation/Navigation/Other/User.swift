
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
    
    func userHandler(name: String) -> User? {
        var user = User(fullName: "", avatar: UIImage(named: "") ?? UIImage(named: "pixel")!, status: "")
        if user.fullName == name {
            return user
        } else {
            return nil
        }
    }
}

class TestUserService: UserService {
    func userHandler(name: String) -> User? {
        let testUser = User(fullName: "Грогу", avatar: UIImage(named: "mandalorian4")!, status: "Катаюсь")
        return testUser
    }
}
