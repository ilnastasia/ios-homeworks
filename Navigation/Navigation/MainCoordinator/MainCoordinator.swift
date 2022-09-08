

import Foundation
import UIKit

protocol MainCoordinatorProtocol {
    func startApplication() -> UIViewController
}

final class MainCoordinator: MainCoordinatorProtocol {
    let loginController = LogInViewController()
    func startApplication() -> UIViewController {
        if loginController.isAuthoruzed == true {
            return MainTabBarController()
        } else {
            return LogInViewController()
        }
    }
}
