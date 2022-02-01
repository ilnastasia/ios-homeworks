
import Foundation
import UIKit

public extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

public extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
