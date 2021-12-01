
import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toAlertButton = UIButton(type: .system)
        toAlertButton.frame.size.height = 50
        toAlertButton.frame.size.width = 200
        toAlertButton.center = view.center
        toAlertButton.setTitle("Открыть алерт", for: .normal)
        toAlertButton.backgroundColor = .white
        toAlertButton.addTarget(self, action:#selector(self.toAlertButtonIsClilcked), for: .touchUpInside)
        
        view.addSubview(toAlertButton)
    }
    
    @objc func toAlertButtonIsClilcked() {
        let alertController = UIAlertController(title: "Название", message: "Сообщение", preferredStyle: .alert)

        present(alertController, animated: true, completion: nil)
        
        alertController.addAction(UIAlertAction(title: "ок", style: .cancel, handler: {action in
            switch action.style {
            case .default:
                print("default")

            case .cancel:
                print("cancel")

            case .destructive:
                print("destructive")
            @unknown default:
                fatalError()
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "выйти", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")

            case .cancel:
                print("cancel")

            case .destructive:
                print("destructive")
            @unknown default:
                fatalError()
            }
        }))
    }    
}
