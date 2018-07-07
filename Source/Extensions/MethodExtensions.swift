import UIKit

func basicErrorAlertWith (title: String, message: String, controller: UIViewController) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel, handler: nil))
    controller.present(alert, animated: true, completion: nil)
}
