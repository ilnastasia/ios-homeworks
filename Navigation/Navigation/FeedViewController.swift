
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

        view.backgroundColor = .white
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
        
    }
    
    @objc func toPostButtonClicked() {
        self.navigationController?.pushViewController(postController!, animated: true)
    }
}



