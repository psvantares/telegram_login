import UIKit

class VerificationViewContainer: UIView {
    
    let titleNumber: UILabel = {
        let titleNumber = UILabel()
        titleNumber.translatesAutoresizingMaskIntoConstraints = false
        titleNumber.textAlignment = .center
        titleNumber.textColor = ThemeManager.currentTheme().mainTitleColor
        titleNumber.font = UIFont.systemFont(ofSize: 32)
        
        return titleNumber
    }()
    
    let subtitleText: UILabel = {
        let subtitleText = UILabel()
        subtitleText.translatesAutoresizingMaskIntoConstraints = false
        subtitleText.font = UIFont.systemFont(ofSize: 15)
        subtitleText.textAlignment = .center
        subtitleText.textColor = ThemeManager.currentTheme().mainTitleColor
        subtitleText.text = "We have sent you an SMS with the code"
        
        return subtitleText
    }()
    
    let verificationCode: UITextField = {
        let verificationCode = UITextField()
        verificationCode.font = UIFont.systemFont(ofSize: 20)
        verificationCode.translatesAutoresizingMaskIntoConstraints = false
        verificationCode.textAlignment = .center
        verificationCode.keyboardType = .numberPad
        verificationCode.textColor = ThemeManager.currentTheme().mainTitleColor
        verificationCode.keyboardAppearance = ThemeManager.currentTheme().keyboardAppearance
        verificationCode.backgroundColor = .clear
        verificationCode.layer.cornerRadius = 25
        verificationCode.layer.borderWidth = 1
        verificationCode.attributedPlaceholder = NSAttributedString(string: "Code", attributes: [NSAttributedStringKey.foregroundColor:
            ThemeManager.currentTheme().mainSubTitleColor])
        verificationCode.layer.borderColor = ThemeManager.currentTheme().borderColor.cgColor
        
        return verificationCode
    }()
    
    let resend: UIButton = {
        let resend = UIButton()
        resend.translatesAutoresizingMaskIntoConstraints = false
        resend.setTitle("Resend", for: .normal)
        resend.contentVerticalAlignment = .center
        resend.contentHorizontalAlignment = .center
        resend.setTitleColor(AppPalette.blue, for: .normal)
        resend.setTitleColor(ThemeManager.currentTheme().mainSubTitleColor, for: .highlighted)
        resend.setTitleColor(ThemeManager.currentTheme().mainSubTitleColor, for: .disabled)
        
        return resend
    }()
    
    
    weak var verificationCodeController: VerificationCodeViewController?
    
    var seconds = 120
    
    var timer = Timer()
    
    var timerLabel: UILabel = {
        var timerLabel = UILabel()
        timerLabel.textColor = ThemeManager.currentTheme().mainSubTitleColor
        timerLabel.font = UIFont.systemFont(ofSize: 13)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.textAlignment = .center
        timerLabel.sizeToFit()
        timerLabel.numberOfLines = 0
        
        return timerLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleNumber)
        addSubview(subtitleText)
        addSubview(verificationCode)
        addSubview(resend)
        addSubview(timerLabel)
        
        let leftConstant: CGFloat = 20
        let rightConstant: CGFloat = -20
        let heightConstant: CGFloat = 50
        let spacingConstant: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleNumber.topAnchor.constraint(equalTo: topAnchor),
            titleNumber.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleNumber.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleNumber.heightAnchor.constraint(equalToConstant: 70),
            
            subtitleText.topAnchor.constraint(equalTo: titleNumber.bottomAnchor),
            subtitleText.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitleText.trailingAnchor.constraint(equalTo: trailingAnchor),
            subtitleText.heightAnchor.constraint(equalToConstant: spacingConstant),
            
            verificationCode.topAnchor.constraint(equalTo: subtitleText.bottomAnchor, constant: spacingConstant),
            verificationCode.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftConstant),
            verificationCode.trailingAnchor.constraint(equalTo: trailingAnchor, constant: rightConstant),
            verificationCode.heightAnchor.constraint(equalToConstant: heightConstant),
            
            resend.topAnchor.constraint(equalTo: verificationCode.bottomAnchor, constant: 5),
            resend.leadingAnchor.constraint(equalTo: leadingAnchor),
            resend.trailingAnchor.constraint(equalTo: trailingAnchor),
            resend.heightAnchor.constraint(equalToConstant: heightConstant),
            
            timerLabel.topAnchor.constraint(equalTo: resend.bottomAnchor, constant: 0),
            timerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftConstant),
            timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: rightConstant),
            timerLabel.heightAnchor.constraint(equalToConstant: heightConstant)
            ])
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}

extension VerificationViewContainer {
    
    typealias CompletionHandler = (_ success: Bool) -> Void
    
    func runTimer() {
        resend.isEnabled = false
        timerLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,  selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            resetTimer()
            timerLabel.isHidden = true
            resend.isEnabled = true
        } else {
            seconds -= 1
            timerLabel.text =  "The message has been sent!\nYou can try again in \(timeString(time: TimeInterval(seconds)))"
        }
    }
    
    func resetTimer() {
        timer.invalidate()
        seconds = 120
        timerLabel.text =  "The message has been sent!\nYou can try again in \(timeString(time: TimeInterval(seconds)))"
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
