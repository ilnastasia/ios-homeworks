
import UIKit

class InfoViewController: UIViewController {
    
    let toAlertButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame.size.height = 50
        button.frame.size.width = 200
        button.setTitle("Открыть алерт", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action:#selector(toAlertButtonIsClilcked), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toAlertButton.center = view.center
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
