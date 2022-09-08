import Foundation
import UIKit

final class FeedCoordinator {
    func showDetail(coordinator: FeedCoordinator) -> UIViewController {
        let viewModel = FeedModel()
        let coordinator = FeedCoordinator()
        let controller = FeedViewController(model: viewModel, coordinator: coordinator)
        controller.title = "Лента"
        return controller
    }
}

final class PostCoordinator {
    func showDetail(navigationController: UINavigationController?, coordinator: PostCoordinator) {
        let controller = PostViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

final class InfoCoordinator {
    func showDetails(navigationController: UINavigationController?, coordinator: InfoCoordinator) {
        let controller = InfoViewController()
        controller.view.backgroundColor = .green
        navigationController?.present(controller, animated: true)
    }
}
