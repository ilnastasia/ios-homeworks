import Foundation

class FeedModel {
    let secretWord = "Ключ"
    
    func check(word: String) {
        if word != "" {
            if word == secretWord {
                NotificationCenter.default.post(name: NSNotification.Name.rightKey, object: nil) 
            } else {
                NotificationCenter.default.post(name: NSNotification.Name.wrongKey, object: nil)
            }
        }
    }
    
}
