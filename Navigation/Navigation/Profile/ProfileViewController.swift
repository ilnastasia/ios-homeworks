
import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    var profileHeadView : ProfileHeaderView?
    var feedController : FeedViewController?
    
    let someButton : UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .lightGray
        navigationItem.title = "Мой профиль"
        
        profileHeadView = ProfileHeaderView()
        profileHeadView?.toAutoLayout()
        someButton.toAutoLayout()
        view.addSubviews(profileHeadView!, someButton)
       
        setupSomeButton()
        setupRrofileHeaderView()
    }
    
    func setupRrofileHeaderView() {
        profileHeadView!.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileHeadView!.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        profileHeadView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeadView!.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }

    func setupSomeButton() {
        someButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        someButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        someButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        someButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        someButton.setTitle("Кнопка", for: .normal)
        someButton.backgroundColor = .systemBlue
        someButton.setTitleColor(.white, for: .normal)
        someButton.layer.cornerRadius = 4
        someButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        someButton.layer.shadowColor = UIColor.black.cgColor
        someButton.layer.shadowRadius = 4
        someButton.layer.shadowOpacity = 0.7
    }
}
