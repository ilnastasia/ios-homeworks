
import UIKit
import StorageService

class FeedViewController: UIViewController {
    
    var postController: PostViewController?
    var feedPost = FeedPost(title: "Пост")
    let model: FeedModel?
    let coordinator: FeedCoordinator?
    
    init(model: FeedModel, coordinator: FeedCoordinator) {
        self.model = model
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.toAutoLayout()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .center
        view.spacing = 10
        return view
    }()
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти на пост😏", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action:#selector(toPostButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Перейти на пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action:#selector(toPostButtonClicked), for: .touchUpInside)
        return button
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.toAutoLayout()
        field.layer.borderColor = UIColor.black.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 12
        field.textColor = .black
        field.font = UIFont(name: "Helvetica-Regular", size: 15)
        return field
    }()
    
    let checkGuessButton: CustomButton = {
        let button = CustomButton(
            title: "Проверить",
            titleColor: .white,
            radius: 10,
            color: .systemBlue)
        
        button.setBackgroundImage(UIImage(named: "pixel"), for: .normal)
        return button
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.backgroundColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        postController = PostViewController()
        postController?.postName = feedPost.title
        
        view.addSubviews(stackView, textField, checkGuessButton, messageLabel)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        setupViews()
        
        checkGuessButton.tapAction = { [weak self] in
            guard let self = self else { return }
            self.checkGuessButtonClicked()
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(wrongKey),
            name: NSNotification.Name.wrongKey,
            object: nil
        )
                
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(rightKey),
            name: NSNotification.Name.rightKey,
            object: nil
        )
    }
    
    func setupViews() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            firstButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            secondButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            textField.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            checkGuessButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5),
            checkGuessButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            checkGuessButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            messageLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 5),
            messageLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            messageLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            messageLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func wrongKey() {
        messageLabel.text = "Слово неверное"
        messageLabel.textColor = .red
    }
    
    @objc func rightKey() {
        messageLabel.text = "Слово верное"
        messageLabel.textColor = .green
    }
    
    @objc func toPostButtonClicked() {
        let coordinator = PostCoordinator()
        coordinator.showDetail(navigationController: navigationController, coordinator: coordinator)
    }
    
    func checkGuessButtonClicked() {
        model?.check(word: textField.text!)
    }
}

extension NSNotification.Name {
    static let wrongKey = NSNotification.Name("wrongKey")
    static let rightKey = NSNotification.Name("rightKey")
}
