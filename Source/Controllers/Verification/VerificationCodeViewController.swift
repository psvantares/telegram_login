import UIKit

class VerificationCodeViewController: UIViewController {
    
    let verificationContainerView = VerificationViewContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        view.addSubview(verificationContainerView)
        verificationContainerView.frame = view.bounds
        verificationContainerView.resend.addTarget(self, action: #selector(sendSMSConfirmation), for: .touchUpInside)
        verificationContainerView.verificationCodeController = self
        configureNavigationBar()
    }
    
    fileprivate func configureNavigationBar () {
        self.navigationItem.hidesBackButton = true
    }
    
    func setRightBarButton(with title: String) {
        let rightBarButton = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(rightBarButtonDidTap))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setLeftBarButton(with title: String) {
        let leftBarButton = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(leftBarButtonDidTap))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc fileprivate func sendSMSConfirmation () {
        
        if currentReachabilityStatus == .notReachable {
            basicErrorAlertWith(title: "No internet connection", message: noInternetError, controller: self)
            return
        }
        
        verificationContainerView.resend.isEnabled = false
        let verificationCode = verificationContainerView.titleNumber.text!
        
        print("verification code:", verificationCode)
        
        self.verificationContainerView.runTimer()
    }
    
    @objc func rightBarButtonDidTap () {
        
    }
    
    @objc func leftBarButtonDidTap () {
        
    }
    
    func changeNumber () {
        verificationContainerView.verificationCode.resignFirstResponder()
        let verificationID = UserDefaults.standard.string(forKey: "ChangeNumberAuthVerificationID")
        let verificationCode = verificationContainerView.verificationCode.text!
        
        print("verification code:", verificationCode)
        
        if verificationID == nil {
            self.verificationContainerView.verificationCode.shake()
            return
        }
        
        if currentReachabilityStatus == .notReachable {
            basicErrorAlertWith(title: "No internet connection", message: noInternetError, controller: self)
            return
        }
    }
    
    func authenticate() {
        verificationContainerView.verificationCode.resignFirstResponder()
        if currentReachabilityStatus == .notReachable {
            basicErrorAlertWith(title: "No internet connection", message: noInternetError, controller: self)
            return
        }
        
        let verificationCode = verificationContainerView.verificationCode.text!
        
        if currentReachabilityStatus == .notReachable {
            basicErrorAlertWith(title: "No internet connection", message: noInternetError, controller: self)
        }
        
        let destination = ProfileViewController()
        destination.userProfileViewContainer.phone.text = self.verificationContainerView.titleNumber.text
        
        if !(self.navigationController!.topViewController!.isKind(of: ProfileViewController.self)) {
            self.navigationController?.pushViewController(destination, animated: true)
        }
    
        print("verification code - authenticate:", verificationCode)
    }
    
    func backPhoneNumber() {
        
    }
}
