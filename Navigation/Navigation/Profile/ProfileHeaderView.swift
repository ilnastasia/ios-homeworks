
import Foundation
import UIKit


class ProfileHeaderView : UIView {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var profileController: ProfileViewController?
    
    let avatarView = UIImageView()
    let nameView = UILabel()
    let descriptionView = UILabel()
    let statusButton = UIButton(type: .system)
    let statusField = UITextField()
    
    private var statusText: String {
        get { return descriptionView.text! }
        set { descriptionView.text = newValue }
    }
    
    let saveName = UserDefaults.standard
    
    override func draw(_ rect: CGRect) {
        
        profileController = ProfileViewController()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        avatarView.frame = CGRect(
            x: 16,
            y: screenHeight/9 + 16,
            width: screenWidth/3.5,
            height: screenWidth/3.5)
        avatarView.layer.borderWidth = 3.0
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = screenWidth/7
        avatarView.layer.contents = UIImage(named: "hedgehog")?.cgImage
        avatarView.clipsToBounds = true
        addSubview(avatarView)
        
        
        nameView.frame = CGRect(
            x: screenWidth/2.75,
            y: screenHeight/9 + 27,
            width: 250,
            height: 21)
        nameView.textColor = .black
        nameView.textAlignment = .justified
        nameView.font = UIFont(name: "Helvetica-Bold", size : 18)
        nameView.text = "Ежик Колючий"
        addSubview(nameView)
        
        
        descriptionView.frame = CGRect(
            x: screenWidth/2.75,
            y: screenWidth/3.5 + screenHeight/9 - 20,
            width: 250,
            height: 18)
        descriptionView.textColor = .gray
        descriptionView.textAlignment = .justified
        descriptionView.font = UIFont(name: "Helvetica-Regular", size : 14)
        descriptionView.text = "Хожу по лесу"
        addSubview(descriptionView)
        
        
        statusButton.frame = CGRect(
            x: 16,
            y: 58 + screenWidth/3.5 + screenHeight/9,
            width: screenWidth - 32,
            height: 50)
        statusButton.setTitle("Установить статус", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action:#selector(self.statusButtonClicked), for: .touchUpInside)
        addSubview(statusButton)
        
        statusField.frame = CGRect(
            x: screenWidth/2.75,
            y: screenWidth/3.5 + screenHeight/9 + 3,
            width: (screenWidth - 16) - screenWidth/2.75,
            height: 40)
        statusField.backgroundColor = .white
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.layer.borderWidth = 1
        statusField.layer.cornerRadius = 12
        statusField.textColor = .black
        statusField.font = UIFont(name: "Helvetica-Regular", size: 15)
        statusField.addTarget(self, action:#selector(statusTextChanged(_:)), for: .editingChanged)
        addSubview(statusField)
        
        guard let text = saveName.object(forKey: "descriptionView") as? String else { return }
            descriptionView.text = text
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Error"
    }

    @objc func statusButtonClicked() {
        saveName.set(descriptionView.text, forKey: "descriptionView")
        print(descriptionView.text ?? "Error")
    }
    
    
}
