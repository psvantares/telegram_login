import UIKit

class ProfileViewContainer: UIView {
    
    lazy var profileImageContainer: UIImageView = {
        let profileImageContainer = UIImageView()
        profileImageContainer.translatesAutoresizingMaskIntoConstraints = false
        profileImageContainer.contentMode = .scaleAspectFill
        profileImageContainer.layer.masksToBounds = true
        profileImageContainer.layer.borderWidth = 1
        profileImageContainer.layer.borderColor = ThemeManager.currentTheme().borderColor.cgColor
        profileImageContainer.layer.cornerRadius = 50
        profileImageContainer.isUserInteractionEnabled = true
        
        return profileImageContainer
    }()
    
    let addPhotoLabel: UILabel = {
        let addPhotoLabel = UILabel()
        addPhotoLabel.font = UIFont.systemFont(ofSize: 20)
        addPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        addPhotoLabel.text = "Add\nphoto"
        addPhotoLabel.numberOfLines = 2
        addPhotoLabel.textColor = ThemeManager.currentTheme().mainSubTitleColor
        addPhotoLabel.textAlignment = .center
        
        return addPhotoLabel
    }()
    
    let userDataContainer: UIView = {
        let userDataContainer = UIView()
        userDataContainer.translatesAutoresizingMaskIntoConstraints = false
        userDataContainer.contentMode = .scaleAspectFill
        userDataContainer.layer.masksToBounds = true
        userDataContainer.layer.borderWidth = 1
        userDataContainer.layer.borderColor = ThemeManager.currentTheme().borderColor.cgColor
        userDataContainer.layer.cornerRadius = 30
        userDataContainer.isUserInteractionEnabled = true
        
        return userDataContainer
    }()
    
    var name: UITextField = {
        let name = UITextField()
        name.font = UIFont.systemFont(ofSize: 20)
        name.enablesReturnKeyAutomatically = true
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textAlignment = .center
        name.textColor = ThemeManager.currentTheme().mainTitleColor
        name.borderStyle = .none
        name.autocorrectionType = .no
        name.returnKeyType = .done
        name.keyboardAppearance = ThemeManager.currentTheme().keyboardAppearance
        name.attributedPlaceholder = NSAttributedString(string: "Enter name",
                                                               attributes: [NSAttributedStringKey.foregroundColor: ThemeManager.currentTheme().mainSubTitleColor])
        
        return name
    }()
    
    let phone: UITextField = {
        let phone = UITextField()
        phone.font = UIFont.systemFont(ofSize: 20)
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.textAlignment = .center
        phone.placeholder = "Phone number"
        phone.borderStyle = .none
        phone.isEnabled = false
        phone.textColor = ThemeManager.currentTheme().mainTitleColor
        
        return phone
    }()
    
    let statusContainer: UIView = {
        let statusContainer = UIView()
        statusContainer.translatesAutoresizingMaskIntoConstraints = false
        statusContainer.contentMode = .scaleAspectFill
        statusContainer.layer.masksToBounds = true
        statusContainer.layer.borderWidth = 1
        statusContainer.layer.borderColor = ThemeManager.currentTheme().borderColor.cgColor
        statusContainer.layer.cornerRadius = 25
        statusContainer.isUserInteractionEnabled = true
        
        return statusContainer
    }()
    
    var status: UITextField = {
        let status = UITextField()
        status.font = UIFont.systemFont(ofSize: 20)
        status.enablesReturnKeyAutomatically = true
        status.translatesAutoresizingMaskIntoConstraints = false
        status.textAlignment = .center
        status.textColor = ThemeManager.currentTheme().mainTitleColor
        status.borderStyle = .none
        status.autocorrectionType = .no
        status.returnKeyType = .done
        status.keyboardAppearance = ThemeManager.currentTheme().keyboardAppearance
        status.attributedPlaceholder = NSAttributedString(string: "Status",
                                                        attributes: [NSAttributedStringKey.foregroundColor: ThemeManager.currentTheme().mainSubTitleColor])
        
        return status
    }()
   
    var countLabel: UILabel = {
        var countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.text = "20"
        countLabel.textAlignment = .center
        countLabel.textColor = ThemeManager.currentTheme().mainTitleColor
        countLabel.font = UIFont.systemFont(ofSize: 18)
        countLabel.sizeToFit()
        
        return countLabel
    }()

    let profileMaxCharactersCount = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageContainer)
        profileImageContainer.addSubview(addPhotoLabel)
        
        addSubview(userDataContainer)
        userDataContainer.addSubview(name)
        userDataContainer.addSubview(phone)
        
        addSubview(statusContainer)
        statusContainer.addSubview(status)
        statusContainer.addSubview(countLabel)

        let leftConstant: CGFloat = 20
        let rightConstant: CGFloat = -20
        let heightConstant: CGFloat = 50
        let spacingConstant: CGFloat = 20

        backgroundColor = ThemeManager.currentTheme().mainBackgroundColor
        
        NSLayoutConstraint.activate([
            profileImageContainer.topAnchor.constraint(equalTo: topAnchor, constant: spacingConstant),
            profileImageContainer.widthAnchor.constraint(equalToConstant: 100),
            profileImageContainer.heightAnchor.constraint(equalToConstant: 100),
            profileImageContainer.leftAnchor.constraint(equalTo: centerXAnchor, constant: -50),
            
            addPhotoLabel.centerXAnchor.constraint(equalTo: profileImageContainer.centerXAnchor),
            addPhotoLabel.centerYAnchor.constraint(equalTo: profileImageContainer.centerYAnchor),
            addPhotoLabel.widthAnchor.constraint(equalToConstant: 100),
            addPhotoLabel.heightAnchor.constraint(equalToConstant: 100),
            
            userDataContainer.topAnchor.constraint(equalTo: profileImageContainer.bottomAnchor, constant: 10),
            userDataContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftConstant),
            userDataContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: rightConstant),
            userDataContainer.heightAnchor.constraint(equalToConstant: 100),
            
            name.topAnchor.constraint(equalTo: userDataContainer.topAnchor, constant: 0),
            name.leftAnchor.constraint(equalTo: userDataContainer.leftAnchor, constant: 0),
            name.rightAnchor.constraint(equalTo: userDataContainer.rightAnchor, constant: 0),
            name.heightAnchor.constraint(equalToConstant: heightConstant),
            
            phone.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 0),
            phone.leftAnchor.constraint(equalTo: userDataContainer.leftAnchor, constant: 0),
            phone.rightAnchor.constraint(equalTo: userDataContainer.rightAnchor, constant: 0),
            phone.heightAnchor.constraint(equalToConstant: heightConstant),
            
            statusContainer.topAnchor.constraint(equalTo: userDataContainer.bottomAnchor, constant: spacingConstant),
            statusContainer.rightAnchor.constraint(equalTo: userDataContainer.rightAnchor),
            statusContainer.leftAnchor.constraint(equalTo: userDataContainer.leftAnchor),
            statusContainer.heightAnchor.constraint(equalToConstant: heightConstant),
            
            status.rightAnchor.constraint(equalTo: statusContainer.rightAnchor, constant: rightConstant),
            status.leftAnchor.constraint(equalTo: statusContainer.leftAnchor, constant: leftConstant),
            status.centerYAnchor.constraint(equalTo: statusContainer.centerYAnchor),
            status.heightAnchor.constraint(equalTo: statusContainer.heightAnchor),
            
            countLabel.rightAnchor.constraint(equalTo: statusContainer.rightAnchor, constant: -15),
            countLabel.centerYAnchor.constraint(equalTo: statusContainer.centerYAnchor),
            countLabel.heightAnchor.constraint(equalTo: statusContainer.heightAnchor),
            ])
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
