

import Foundation

protocol LoginFactory {
    func returnInspector() -> LoginInspector
}

class Factory: LoginFactory {
    static let shared = Factory()
    
    func returnInspector() -> LoginInspector {
        let loginInspector = LoginInspector()
        return loginInspector
    }
}
