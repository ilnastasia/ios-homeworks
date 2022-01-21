
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let feedController = FeedViewController(feedPost: FeedPost(title: "Пост"))
    let profileController = ProfileViewController()
    let logInController = LogInViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .systemGray6

        let navigationBar = UINavigationBar.appearance()
        navigationBar.standardAppearance = barAppearance
        navigationBar.scrollEdgeAppearance = barAppearance
        
        window = UIWindow()
        
        let tabbarController = UITabBarController()
        
        let tabbarAppearance = UITabBarAppearance()
        tabbarAppearance.backgroundColor = .systemGray6
        
        let tabbar = UITabBar.appearance()
        tabbar.standardAppearance = tabbarAppearance
        tabbar.scrollEdgeAppearance = tabbarAppearance
        
        let userFeed = UINavigationController(rootViewController: feedController)
        let userFeedItem = UITabBarItem()
        userFeedItem.title = "Новости"
        userFeedItem.image = UIImage(systemName: "scroll.fill")
        userFeed.tabBarItem = userFeedItem
        
        let userProfile = UINavigationController(rootViewController: logInController)
        let userProfileItem = UITabBarItem()
        userProfileItem.title = "Профиль"
        userProfileItem.image = UIImage(systemName: "person.fill")
        userProfile.tabBarItem = userProfileItem
        
        tabbarController.viewControllers = [userFeed, userProfile]
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()

        return true
    }
}





