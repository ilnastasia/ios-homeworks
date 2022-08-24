
import UIKit

class CustomButton: UIButton {
    var title: String
    var titleColor: UIColor
    var radius: Int
    var color: UIColor
    //var image: UIImage
    
    var tapAction: (()->Void)?
    
    init(title: String, titleColor: UIColor, radius: Int, color: UIColor) {
        self.title = title
        self.titleColor = titleColor
        self.color = color
        self.radius = radius

        
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        backgroundColor = color
        titleLabel?.textColor = titleColor
        layer.cornerRadius = CGFloat(radius)
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        //setBackgroundImage(image, for: .normal)
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped() {
        tapAction?()
    }
}
