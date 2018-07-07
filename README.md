## Light and Dark theme
<p align="center">
<img src="https://raw.githubusercontent.com/dworkinnbarimen/telegram_login/master/Resources/dark_login.gif" width="171"/>
<img src="https://raw.githubusercontent.com/dworkinnbarimen/telegram_login/master/Resources/light_login.gif" width="171"/>
</p>

## Usage
Changing the theme `AppDelegate.swift`:
1) Light
2) Dark

``` swift
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
```
## Compatibility
Telegram Login is written in Swift 4 and requires iOS 10.0 or later.

## License
This project is licensed under the GNU General Public License v3.0 - see the [LICENSE.md](https://github.com/dworkinnbarimen/telegram_login/blob/master/LICENSE) file for details
