
import Foundation
import UIKit

class ProfileHeaderView : UIView {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let avatarView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameView : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionView : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statusButton : UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statusField : UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private var statusText: String {
        get { return descriptionView.text ?? "Error" }
        set { descriptionView.text = newValue }
    }
    
    let saveName = UserDefaults.standard

    override func draw(_ rect: CGRect) {
        addSubviews(statusField, statusButton, descriptionView, nameView, avatarView)
        
        setupAvatarView()
        setupNameView()
        setupDescriptionView()
        setupStatusButton()
        setupStatusField()
        
        guard let text = saveName.object(forKey: "descriptionView") as? String else { return }
            descriptionView.text = text
    }
    
    func setupAvatarView() {
        avatarView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  16).isActive = true
        avatarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3.5).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: screenWidth / 3.5).isActive = true
        avatarView.layer.borderWidth = 3.0
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = screenWidth / 7
        avatarView.layer.contents = UIImage(named: "hedgehog")?.cgImage
        avatarView.clipsToBounds = true
    }
    
    func setupNameView() {
        nameView.topAnchor.constraint(equalTo: topAnchor, constant:  27).isActive = true
        nameView.leftAnchor.constraint(equalTo: leftAnchor, constant: screenWidth / 2.75).isActive = true
        nameView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        nameView.textColor = .black
        nameView.textAlignment = .justified
        nameView.font = UIFont(name: "Helvetica-Bold", size : 18)
        nameView.text = "Ежик Колючий"
    }
    
    func setupDescriptionView() {
        descriptionView.topAnchor.constraint(equalTo: topAnchor, constant: screenWidth / 3.5 - 20).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: leftAnchor, constant: screenWidth / 2.75).isActive = true
        descriptionView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        descriptionView.textColor = .gray
        descriptionView.textAlignment = .justified
        descriptionView.font = UIFont(name: "Helvetica-Regular", size : 14)
        descriptionView.text = "Хожу по лесу"
    }
    
    func setupStatusButton() {
        statusButton.topAnchor.constraint(equalTo: topAnchor, constant: 58 + screenWidth / 3.5).isActive = true
        statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        statusButton.widthAnchor.constraint(equalToConstant: screenWidth - 32).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        statusButton.setTitle("Установить статус", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action:#selector(self.statusButtonClicked), for: .touchUpInside)
    }
    
    func setupStatusField() {
        statusField.topAnchor.constraint(equalTo: topAnchor, constant: screenWidth / 3.5 + 3).isActive = true
        statusField.leftAnchor.constraint(equalTo: leftAnchor, constant: screenWidth / 2.75).isActive = true
        statusField.widthAnchor.constraint(equalToConstant: (screenWidth - 16) - screenWidth / 2.75).isActive = true
        statusField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        statusField.backgroundColor = .white
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.layer.borderWidth = 1
        statusField.layer.cornerRadius = 12
        statusField.textColor = .black
        statusField.font = UIFont(name: "Helvetica-Regular", size: 15)
        statusField.addTarget(self, action:#selector(statusTextChanged(_:)), for: .editingChanged)
    }
    
    @objc public func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Error"
    }

    @objc public func statusButtonClicked() {
        saveName.set(descriptionView.text, forKey: "descriptionView")
        print(descriptionView.text ?? "Error")
    }
}

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
            subviews.forEach { addSubview($0) }
    }
}
