import Foundation
import UIKit

final class ProfileCoordinator {
    func showDetails(coordinator: ProfileCoordinator) -> UIViewController {
        let userService = TestUserService()
        let controller = ProfileViewController(userService: userService, name: "")
        controller.title = "Профиль"
        return controller
    }
}

final class PhotoCoordinator {
    func showDetails(navigationController: UINavigationController, coordinator: PhotoCoordinator) {
        let controller = PhotosViewController()
        navigationController.pushViewController(controller, animated: true)
    }
}
