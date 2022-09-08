
import UIKit
import StorageService

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .systemGray6

        let navigationBar = UINavigationBar.appearance()
        navigationBar.standardAppearance = barAppearance
        navigationBar.scrollEdgeAppearance = barAppearance
        
        let mainCoordinator = MainCoordinator()
        
        window?.rootViewController = mainCoordinator.startApplication()
        window?.makeKeyAndVisible()

        return true
    }
}





