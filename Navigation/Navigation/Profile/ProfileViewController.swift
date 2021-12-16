
import Foundation
import UIKit


class ProfileViewController : UIViewController {
    
    var profileHeadView : ProfileHeaderView?
    var feedController: FeedViewController?
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .lightGray
        navigationItem.title = "Мой профиль"
        
        profileHeadView = ProfileHeaderView()
        view.addSubview(profileHeadView!)
       
        UpperBorder()
    }
    
    override func viewWillLayoutSubviews() {
        profileHeadView!.frame = view.frame
    }
    
    public func UpperBorder() {
        
        let upperBorderView = UIView()
         
        upperBorderView.backgroundColor = .white
        view.addSubview(upperBorderView)

        upperBorderView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: upperBorderView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0, constant: screenWidth)

        let heightConstraint = NSLayoutConstraint(item: upperBorderView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0, constant: screenHeight/9)
        
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
