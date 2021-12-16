
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        navigationItem.title = "Лента"
        
        postController = PostViewController()
        postController?.postName = post.title

        let toPostButton = UIButton(type: .system)
        toPostButton.frame.size.height = 50
        toPostButton.frame.size.width = 200
        toPostButton.center = view.center
        toPostButton.setTitle("Открыть пост", for: .normal)
        toPostButton.backgroundColor = .systemGray
        toPostButton.addTarget(self, action:#selector(self.toPostButtonClicked), for: .touchUpInside)
        view.addSubview(toPostButton)
        
        UpperBorder()
    }
    
    @objc func toPostButtonClicked() {
        self.navigationController?.pushViewController(postController!, animated: true)
    }
    
    func UpperBorder() {

        let upperBorderView = UIView()

        upperBorderView.backgroundColor = .white
        view.addSubview(upperBorderView)

        let upperBorderWidth = UIScreen.main.bounds.width
        let upperBorderHeight = UIScreen.main.bounds.height

        upperBorderView.translatesAutoresizingMaskIntoConstraints = false

        let widthConstraint = NSLayoutConstraint(item: upperBorderView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0, constant: upperBorderWidth)

        let heightConstraint = NSLayoutConstraint(item: upperBorderView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0, constant: upperBorderHeight/9)

        let horizontalConstraint = NSLayoutConstraint(item: upperBorderView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0)

        let verticalConstraint = NSLayoutConstraint(item: upperBorderView,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1.0,
            constant: 0)

        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}



