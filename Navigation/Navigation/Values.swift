
import Foundation
import UIKit

struct Values {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    lazy var avatarLength = screenWidth / 3.5
    lazy var nameLeftBound = screenWidth / 2.75
    lazy var statusButtonLength = screenWidth - 32
    lazy var avatarCornerRadius = screenWidth / 7
    lazy var statusUpperBound = (screenWidth / 3.5) - 20
    lazy var statusButtonUpperBound = (screenWidth / 3.5) + 58
    lazy var statusFieldUpperBound = (screenWidth / 3.5) + 3
    lazy var statusFieldLength = screenWidth - screenWidth / 3.5 - 48
}
