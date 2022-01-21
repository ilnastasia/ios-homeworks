
import Foundation
import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var values: Values?
    
    let avatarView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.white.cgColor
        view.image = UIImage(named: "hedgehog")
        view.clipsToBounds = true
        return view
    }()
    
    let nameView: UILabel = {
        let view = UILabel()
        view.toAutoLayout()
        view.textColor = .black
        view.textAlignment = .justified
        view.font = UIFont(name: "Helvetica-Bold", size : 18)
        view.text = "Ежик Колючий"
        return view
    }()
    
    let descriptionView: UILabel = {
        let view = UILabel()
        view.toAutoLayout()
        view.textColor = .gray
        view.textAlignment = .justified
        view.font = UIFont(name: "Helvetica-Regular", size : 14)
        view.text = "Хожу по лесу"
        return view
    }()
    
    let statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.toAutoLayout()
        button.setTitle("Установить статус", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action:#selector(statusButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let statusField: UITextField = {
        let view = UITextField()
        view.toAutoLayout()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.textColor = .black
        view.font = UIFont(name: "Helvetica-Regular", size: 15)
        view.addTarget(self, action:#selector(statusTextChanged(_:)), for: .editingChanged)
        return view
    }()
    
    private var statusText: String {
        get { return descriptionView.text ?? "Error" }
        set { descriptionView.text = newValue }
    }
    
    let saveName = UserDefaults.standard

    override func draw(_ rect: CGRect) {
        addSubviews(statusField, statusButton, descriptionView, nameView, avatarView)
        
        setupViews()
        
        guard let text = saveName.object(forKey: "descriptionView") as? String else { return }
            descriptionView.text = text
    }
    
    func setupViews() {
        values = Values()
        
        NSLayoutConstraint.activate([
            avatarView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  16),
            avatarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3.5),
            avatarView.heightAnchor.constraint(equalToConstant: values?.avatarLength ?? 0),
            
            
            nameView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  27),
            nameView.leftAnchor.constraint(equalTo: leftAnchor, constant: values?.nameLeftBound ?? 0),
            nameView.widthAnchor.constraint(equalToConstant: 250),
            nameView.heightAnchor.constraint(equalToConstant: 21),
            
            
            descriptionView.topAnchor.constraint(equalTo: topAnchor, constant: values?.statusUpperBound ?? 0),
            descriptionView.leftAnchor.constraint(equalTo: leftAnchor, constant: values?.nameLeftBound ?? 0),
            descriptionView.widthAnchor.constraint(equalToConstant: 250),
            descriptionView.heightAnchor.constraint(equalToConstant: 18),
            
            
            statusButton.topAnchor.constraint(equalTo: topAnchor, constant: values?.statusButtonUpperBound ?? 0),
            statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            statusButton.widthAnchor.constraint(equalToConstant: values?.statusButtonLength ?? 0),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            statusField.topAnchor.constraint(equalTo: topAnchor, constant: values?.statusFieldUpperBound ?? 0),
            statusField.leftAnchor.constraint(equalTo: leftAnchor, constant: values?.nameLeftBound ?? 0),
            statusField.widthAnchor.constraint(equalToConstant: values?.statusFieldLength ?? 0),
            statusField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        avatarView.layer.cornerRadius = values?.avatarCornerRadius ?? 0
    }
    
    @objc public func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Error"
    }

    @objc public func statusButtonClicked() {
        saveName.set(descriptionView.text, forKey: "descriptionView")
        print(descriptionView.text ?? "Error")
    }
}
