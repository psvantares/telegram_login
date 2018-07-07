import UIKit

class ProfileViewController: UIViewController {
    
    let userProfileViewContainer = ProfileViewContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        view.addSubview(userProfileViewContainer)
        
        configureNavigationBar()
        configureContainerView()
        configureNotificationCenter()
    }
    
    fileprivate func configureNavigationBar () {
        let rightBarButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(rightBarButtonDidTap))
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.title = "Profile"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    fileprivate func configureContainerView() {
        userProfileViewContainer.frame = view.bounds
        userProfileViewContainer.profileImageContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openUserProfilePicture)))
        userProfileViewContainer.name.delegate = self
        userProfileViewContainer.status.delegate = self
    }
    
    fileprivate func configureNotificationCenter() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (notification) in
            self.view.frame.origin.y = -57
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (notification) in
            self.view.frame.origin.y = 57
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        userProfileViewContainer.frame = view.bounds
        userProfileViewContainer.layoutIfNeeded()
    }
    
    @objc fileprivate func openUserProfilePicture() {
        print("Click my gallery")
        
        guard currentReachabilityStatus != .notReachable else {
            basicErrorAlertWith(title: basicErrorTitleForAlert, message: noInternetError, controller: self)
            return
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.userProfileViewContainer.name.resignFirstResponder()
        self.userProfileViewContainer.status.resignFirstResponder()
    }
}

extension ProfileViewController {
    
    @objc func rightBarButtonDidTap () {
        userProfileViewContainer.name.resignFirstResponder()
        if userProfileViewContainer.name.text?.count == 0 ||
            userProfileViewContainer.name.text!.trimmingCharacters(in: .whitespaces).isEmpty {
            userProfileViewContainer.name.shake()
        } else {
            
            if currentReachabilityStatus == .notReachable {
                basicErrorAlertWith(title: "No internet connection", message: noInternetError, controller: self)
                return
            }
            
            updateUserData()
        }
    }
    
    func checkIfUserDataExists(completionHandler: Bool) {
        
    }
    
    func updateUserData() {
        
        
    }
}

extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        userProfileViewContainer.countLabel.text = "\(userProfileViewContainer.profileMaxCharactersCount - (userProfileViewContainer.status.text?.count)!)"
        userProfileViewContainer.countLabel.isHidden = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == userProfileViewContainer.status {
            guard let text = textField.text else { return true }
            let newLength = text.utf16.count + string.utf16.count - range.length
            let index = Int(newLength)
        
            if index <= userProfileViewContainer.profileMaxCharactersCount {
                userProfileViewContainer.countLabel.text = String(userProfileViewContainer.profileMaxCharactersCount - index)
            }
            
            return newLength <= userProfileViewContainer.profileMaxCharactersCount
        }
        else {
            
        }

        return true
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
