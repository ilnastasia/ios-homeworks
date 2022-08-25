
import Foundation
import UIKit
import SnapKit

protocol TapViewDelegate: AnyObject {
    func viewDidTapAvatar()
}

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: TapViewDelegate?
    
    lazy var avatarView: UIImageView = {
        let view = UIImageView()
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.white.cgColor
        view.image = UIImage(named: "hedgehog")
        view.layer.cornerRadius = Constants.avatarCornerRadius
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
        view.addGestureRecognizer(recognizer)
        
        return view
    }()
    
    let nameView: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .justified
        view.font = UIFont(name: "Helvetica-Bold", size : 18)
        view.text = "Ежик Колючий"
        return view
    }()
    
    let descriptionView: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.textAlignment = .justified
        view.font = UIFont(name: "Helvetica-Regular", size : 14)
        view.text = "Хожу по лесу"
        return view
    }()
    
    lazy var statusButton: CustomButton = {
        let button = CustomButton(
            title: "Установить статус",
            titleColor: .white,
            radius: 4,
            color: .systemBlue)
        
        return button
    }()
    
    let statusField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.textColor = .black
        view.font = UIFont(name: "Helvetica-Regular", size: 15)
        view.addTarget(self, action:#selector(statusTextChanged(_:)), for: .editingChanged)
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        statusButton.tapAction = { [weak self] in
            guard let self = self else { return }
            self.statusButtonClicked()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        delegate?.viewDidTapAvatar()
        print("avatar tapped")
    }
    
    func setupViews() {
        
        avatarView.snp.makeConstraints { maker in
            maker.left.equalTo(self.contentView).inset(16)
            maker.top.equalTo(self.contentView).inset(16)
            maker.width.height.equalTo(Constants.avatarLength)
        }
        
        nameView.snp.makeConstraints { maker in
            maker.top.equalTo(self.contentView).inset(27)
            maker.left.equalTo(Constants.nameLeftBound)
            maker.height.equalTo(21)
            maker.width.equalTo(250)
        }
        
        descriptionView.snp.makeConstraints { maker in
            maker.top.equalTo(Constants.statusUpperBound)
            maker.left.equalTo(Constants.nameLeftBound)
            maker.width.equalTo(250)
            maker.height.equalTo(18)
        }
        
        statusButton.snp.makeConstraints { maker in
            maker.top.equalTo(Constants.statusButtonUpperBound)
            maker.left.equalTo(self.contentView).inset(16)
            maker.width.equalTo(Constants.statusButtonLength)
            maker.height.equalTo(50)
        }
        
        statusField.snp.makeConstraints { maker in
            maker.top.equalTo(Constants.statusFieldUpperBound)
            maker.left.equalTo(Constants.nameLeftBound)
            maker.width.equalTo(Constants.statusFieldLength)
            maker.height.equalTo(40)
        }
        
    }
    
    @objc public func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "Error"
    }

    @objc public func statusButtonClicked() {
        saveName.set(descriptionView.text, forKey: "descriptionView")
        print(descriptionView.text ?? "Error")
    }
}
