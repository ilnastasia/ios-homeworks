
import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeadView: ProfileHeaderView?
    var feedController: FeedViewController?
    var values: Values?
    
    let someButton: UIButton = {
        let button = UIButton(type: .system)
        button.toAutoLayout()
        button.setTitle("Кнопка", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .lightGray
        navigationItem.title = "Мой профиль"
        
        profileHeadView = ProfileHeaderView()
        profileHeadView?.toAutoLayout()
        someButton.toAutoLayout()
        view.addSubviews(profileHeadView!, someButton)
       
        setupViews()
    }
    
    func setupViews() {
        values = Values()
        
        NSLayoutConstraint.activate([
            profileHeadView!.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeadView!.widthAnchor.constraint(equalToConstant: values?.screenWidth ?? 0),
            profileHeadView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeadView!.heightAnchor.constraint(equalToConstant: 220),
            
            someButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            someButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            someButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            someButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
