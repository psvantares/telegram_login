import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        ThemeManager.setTheme(theme: .Dark)
    
        let theme = ThemeManager.currentTheme()
        ThemeManager.applyTheme(theme: theme)
        
        let mainController = MainTabBarController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainController
        window?.makeKeyAndVisible()
        window?.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        
        presentController(above: mainController)

        return true
    }
    
    func presentController(above controller: UITabBarController) {

        let destination = PhoneNumberController()
        destination.view.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        let newNavigationController = UINavigationController(rootViewController: destination)
        newNavigationController.navigationBar.barTintColor = ThemeManager.currentTheme().mainBackgroundColor
        newNavigationController.modalTransitionStyle = .coverVertical
        controller.present(newNavigationController, animated: false, completion: nil)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

