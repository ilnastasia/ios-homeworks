
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let feedController = FeedViewController(post: Post(title: "Пост"))
    let profilecController = ProfileViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let tabbarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .white
        
        
        let userFeed = UINavigationController(rootViewController: feedController)
        let userFeedItem = UITabBarItem()
        userFeedItem.title = "Новости"
        userFeedItem.image = UIImage(systemName: "scroll.fill")
        userFeed.tabBarItem = userFeedItem
        
        let userProfile = UINavigationController(rootViewController: profilecController)
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

struct Post {
    var title: String
}

