
import UIKit

class FeedViewController: UIViewController {
    
    var postController: PostViewController?
    var post : Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let firstButton : UIButton = {
        let button = UIButton()
        return button
    }()
    
    let secondButton : UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        navigationItem.title = "Лента"
        
        postController = PostViewController()
        postController?.postName = post.title
        
        view.addSubviews(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        setupStackView()
        setupButtons()
    }
    
    func setupStackView() {
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupButtons() {
        firstButton.setTitle("Перейти на пост", for: .normal)
        firstButton.backgroundColor = .systemBlue
        firstButton.setTitleColor(.white, for: .normal)
        firstButton.layer.cornerRadius = 4
        firstButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        firstButton.layer.shadowColor = UIColor.black.cgColor
        firstButton.layer.shadowRadius = 4
        firstButton.layer.shadowOpacity = 0.7
        firstButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        firstButton.addTarget(self, action:#selector(self.toPostButtonClicked), for: .touchUpInside)
        
        secondButton.setTitle("Перейти на пост", for: .normal)
        secondButton.backgroundColor = .systemBlue
        secondButton.setTitleColor(.white, for: .normal)
        secondButton.layer.cornerRadius = 4
        secondButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        secondButton.layer.shadowColor = UIColor.black.cgColor
        secondButton.layer.shadowRadius = 4
        secondButton.layer.shadowOpacity = 0.7
        secondButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        secondButton.addTarget(self, action:#selector(self.toPostButtonClicked), for: .touchUpInside)
    }
    
    @objc func toPostButtonClicked() {
        self.navigationController?.pushViewController(postController!, animated: true)
    }
    
}
