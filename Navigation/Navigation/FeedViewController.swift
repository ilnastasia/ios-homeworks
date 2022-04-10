
import UIKit
import StorageService

class FeedViewController: UIViewController {
    
    var postController: PostViewController?
    var feedPost: FeedPost
    
    init(feedPost: FeedPost) {
        self.feedPost = feedPost
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        navigationItem.title = "Лента"
        
        postController = PostViewController()
        postController?.postName = feedPost.title
        
        view.addSubviews(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        setupViews()
    }
    
    func setupViews() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            firstButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            secondButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    
    @objc func toPostButtonClicked() {
        self.navigationController?.pushViewController(postController!, animated: true)
    }
}
