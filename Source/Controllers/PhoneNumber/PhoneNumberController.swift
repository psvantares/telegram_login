import UIKit

class PhoneNumberController: PhoneNumberViewController {
    
    override func configurePhoneNumberContainerView() {
        super.configurePhoneNumberContainerView()
        
        phoneNumberViewContainer.instructions.text = "Please confirm your country code\nand enter your phone number."
        phoneNumberViewContainer.terms.text = "By signing up, you agree to the Terms and Conditions of Servise. Also if you still have not read the Privacy Policy, please take a look before signing up."

        let attributes = [NSAttributedStringKey.foregroundColor: ThemeManager.currentTheme().mainSubTitleColor]
        phoneNumberViewContainer.phoneNumber.attributedPlaceholder = NSAttributedString(string: "Your phone number", attributes: attributes)
    }
    
    override func rightBarButtonDidTap() {
        super.rightBarButtonDidTap()
        
        let destination = VerificationController()
        destination.verificationContainerView.titleNumber.text = phoneNumberViewContainer.countryCode.text! + phoneNumberViewContainer.phoneNumber.text!
        navigationController?.pushViewController(destination, animated: true)
    }
}
