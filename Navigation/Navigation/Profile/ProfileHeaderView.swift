
import Foundation
import UIKit


class ProfileHeaderView : UIView {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var profileController: ProfileViewController?
    
    let avatarView = UIImageView()
    let nameView = UILabel()
    let descriptionView = UILabel()
    let statusButton = UIButton(type: .system)
    
    override func draw(_ rect: CGRect) {
        
        profileController = ProfileViewController()
        
        avatarView.frame = CGRect(
            x: 16,
            y: profileController!.screenHeight/9 + 16,
            width: profileController!.screenWidth/3.5,
            height: profileController!.screenWidth/3.5)
        avatarView.layer.borderWidth = 3.0
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = profileController!.screenWidth/7
        avatarView.layer.contents = UIImage(named: "hedgehog")?.cgImage
        avatarView.clipsToBounds = true
        addSubview(avatarView)
        
        
        nameView.frame = CGRect(x: profileController!.screenWidth/2.75, y: profileController!.screenHeight/9 + 27, width: 250, height: 21)
        nameView.textColor = .black
        nameView.textAlignment = .justified
        nameView.font = UIFont(name: "Helvetica-Bold", size : 18)
        nameView.text = "Ежик Колючий"
        addSubview(nameView)
        
        
        descriptionView.frame = CGRect(x: profileController!.screenWidth/2.75, y: profileController!.screenWidth/3.5 + profileController!.screenHeight/9 - 20, width: 250, height: 18)
        descriptionView.textColor = .gray
        descriptionView.textAlignment = .justified
        descriptionView.font = UIFont(name: "Helvetica-Regular", size : 14)
        descriptionView.text = "Хожу по лесу"
        addSubview(descriptionView)
        
        
        statusButton.frame = CGRect(x: 16, y: 32 + profileController!.screenWidth/3.5 + profileController!.screenHeight/9, width: profileController!.screenWidth - 32, height: 50)
        statusButton.setTitle("Установить статус", for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action:#selector(self.statusButtonClicked), for: .touchUpInside)
        addSubview(statusButton)
    }

    @objc func statusButtonClicked() {
        print(descriptionView.text!)
    }
}
