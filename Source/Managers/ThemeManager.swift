import UIKit

let ThemeKey = "ThemeKey"

enum Theme: Int {
    case Light, Dark
    
    var mainBackgroundColor: UIColor {
        switch self {
        case .Light:
            return AppPalette.white
        case .Dark:
            return AppPalette.black
        }
    }
    
    var mainTitleColor: UIColor {
        switch self {
        case .Light:
            return AppPalette.black
        case .Dark:
            return AppPalette.white
        }
    }
    
    var mainSubTitleColor: UIColor {
        switch self {
        case .Light:
            return AppPalette.grey
        case .Dark:
            return AppPalette.grey
        }
    }
    
    var barBackgroundColor: UIColor {
        switch self {
        case .Light:
            return AppPalette.grey
        case .Dark:
            return AppPalette.grey
        }
    }
    
    var buttonColor: UIColor {
        switch self {
        case .Light:
            return AppPalette.blue
        case .Dark:
            return AppPalette.blue
        }
    }
    
    var buttonTitleColor: UIColor {
        switch self {
            case .Light:
            return AppPalette.white
        case .Dark:
            return AppPalette.white
        }
    }
    
    var keyboardAppearance: UIKeyboardAppearance {
        switch self {
        case .Light:
            return  .default
        case .Dark:
            return .dark
        }
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .Light:
            return .default
        case .Dark:
            return .black
        }
    }
    
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .Light:
            return .default
        case .Dark:
            return .lightContent
        }
    }
    
    var scrollBarStyle: UIScrollViewIndicatorStyle {
        switch self {
        case .Light:
            return .default
        case .Dark:
            return .white
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .Light:
            return UIColor.white
        case .Dark:
            return UIColor.black
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .Light:
            return UIColor(red: 242.0/255.0, green: 101.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        case .Dark:
            return UIColor(red: 34.0/255.0, green: 128.0/255.0, blue: 66.0/255.0, alpha: 1.0)
            
        }
    }
    
    var borderColor: UIColor {
        switch self {
        case .Light:
            return AppPalette.grey
        case .Dark:
            return AppPalette.blue
            
        }
    }
    
    var cellSelectionColor: UIColor {
        switch self {
        case .Light:
            return  UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        case .Dark:
            return UIColor(red:0.10, green:0.10, blue:0.10, alpha:1.0)
        }
    }
    
    var pagnationColor: UIColor {
        switch self {
        case .Light:
            return AppPalette.grey
        case .Dark:
            return AppPalette.white
            
        }
    }
    
    var inputTextViewColor: UIColor {
        switch self {
        case .Light:
            return UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        case .Dark:
            return UIColor(red: 0.11, green: 0.11, blue: 0.11, alpha: 1.0)
        }
    }
}

func setGlobalNavigationBarSettingsAccordingToTheme(theme: Theme) {
    
    UITabBar.appearance().barStyle = theme.barStyle
    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().barStyle = theme.barStyle
    UINavigationBar.appearance().barTintColor = theme.barBackgroundColor
    UITabBar.appearance().barTintColor = theme.barBackgroundColor
    UIApplication.shared.statusBarStyle = theme.statusBarStyle
    UITableViewCell.appearance().selectionColor = ThemeManager.currentTheme().cellSelectionColor
    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: theme.mainTitleColor]
}

struct ThemeManager {
    
    static func applyTheme(theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: ThemeKey)
        UserDefaults.standard.synchronize()
        setGlobalNavigationBarSettingsAccordingToTheme(theme: theme)
    }
    
    static func setTheme(theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: ThemeKey)
        UserDefaults.standard.synchronize()
    }
    
    static func currentTheme() -> Theme {
        let defaults = UserDefaults.standard
        let currentTheme = defaults.integer(forKey: ThemeKey)
        
        if currentTheme == 0 {
            return .Light
        }
        else if currentTheme == 1 {
            return .Dark
        }
        else {
            return .Light
        }
    }
}

struct AppPalette {
    static let white = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let black = #colorLiteral(red: 0.1607843137, green: 0.168627451, blue: 0.2, alpha: 1)
    static let blue = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    static let red = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    static let grey = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
}
