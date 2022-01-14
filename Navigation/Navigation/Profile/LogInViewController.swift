
import UIKit

class LogInViewController: UIViewController {
    
    let profileController = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubviews(logoView, logInStackView, loginButton)

        logInStackView.addArrangedSubview(loginTextField)
        logInStackView.addArrangedSubview(passwordTextField)
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    let logoView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.image = UIImage(named: "logo")
        return view
    }()
    
    let logInStackView: UIStackView = {
        let view = UIStackView()
        view.toAutoLayout()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .center
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray6
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    
    let loginTextField: UITextField = {
        let view = UITextField()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.autocapitalizationType = .none
        view.tintColor = .black
        view.placeholder = "Email or phone"
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftViewMode = .always
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    let passwordTextField: UITextField = {
        let view = UITextField()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.autocapitalizationType = .none
        view.tintColor = .black
        view.placeholder = "Password"
        view.isSecureTextEntry = true
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftViewMode = .always
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return view
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = VKColorSet
        button.toAutoLayout()
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(toProfileButtonClicked), for: .touchUpInside)
        //button.backgroundColor = UIColor(patternImage: UIImage(named: "pixel")!)
        return button
    }()
    
    func setupViews() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            logInStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            logInStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            logInStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            logInStackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.widthAnchor.constraint(equalTo: logInStackView.widthAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: logInStackView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: logInStackView.bottomAnchor, constant: 16),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func toProfileButtonClicked() {
        self.navigationController?.pushViewController(profileController, animated: true)
    }
}
