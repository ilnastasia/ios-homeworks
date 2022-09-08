
import UIKit

class PostViewController: UIViewController {
    
    var postName: String?
    
    var infoController: InfoViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        navigationItem.title = postName

        let infoButton = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(infoButtonIsClicked))
        self.navigationItem.rightBarButtonItem = infoButton

    }
    
    @objc func infoButtonIsClicked() {
        let coordinator = InfoCoordinator()
        coordinator.showDetails(navigationController: navigationController, coordinator: coordinator)
    }
}
