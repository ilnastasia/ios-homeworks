
import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad()  {
        super.viewDidLoad()
        
        let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as! UIView
        self.view = profileView
    }
        
}
