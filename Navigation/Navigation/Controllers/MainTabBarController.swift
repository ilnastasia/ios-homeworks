
import UIKit

class MainTabBarController: UITabBarController {
    
    private let feedVC = CoordinatorFactory(navigationController: UINavigationController(), flow: .feed)
    
    private let profileVC = CoordinatorFactory(navigationController: UINavigationController(), flow: .profile)

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor.systemGray6
        
        setControllers()
    }
    
    private func setControllers() {
        viewControllers = [
            feedVC.navigationController,
            profileVC.navigationController
        ]
    }
}
