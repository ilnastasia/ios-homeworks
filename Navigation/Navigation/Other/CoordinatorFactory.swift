

import Foundation
import UIKit
import StorageService

final class CoordinatorFactory {
    enum Flow {
        case feed
        case profile
    }
    
    let navigationController: UINavigationController
    let flow: Flow
    
    init(navigationController: UINavigationController, flow: Flow) {
        self.navigationController = navigationController
        self.flow = flow
        startModule()
    }
    
    func startModule() {
        switch flow {
        case .feed:
            let coordinator = FeedCoordinator()
            let feedController = coordinator.showDetail(coordinator: coordinator)
            navigationController.setViewControllers([feedController], animated: true)
            navigationController.tabBarItem.title = "Новости"
            navigationController.tabBarItem.image = UIImage(systemName: "scroll.fill")
            navigationController.navigationBar.barTintColor = UIColor.systemGray6
        case .profile:
            let coordinator = ProfileCoordinator()
            let profileController = coordinator.showDetails(coordinator: coordinator)
            navigationController.setViewControllers([profileController], animated: true)
            navigationController.tabBarItem.title = "Профиль"
            navigationController.tabBarItem.image = UIImage(systemName: "person.fill")
            navigationController.navigationBar.barTintColor = UIColor.systemGray6
        }
    }
}
