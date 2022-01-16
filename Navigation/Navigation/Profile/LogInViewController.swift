
import UIKit

class LogInViewController: UIViewController {
    
    let profileController = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForKeyboardNotifications()
        tapToHideKeyboard()

        view.backgroundColor = .white
        view.addSubviews(scrollView)
        scrollView.addSubviews(logoView, logInStackView,  loginButton)

        logInStackView.addArrangedSubview(loginTextField)
        logInStackView.addArrangedSubview(passwordTextField)
        
        setupViews()
    }
    
    deinit {
        removeKeyboardNotifications()
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
        view.tintColor = VKColorSetForNormal
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
        view.tintColor = VKColorSetForNormal
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
        let button = UIButton(type: .system)
        button.toAutoLayout()
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action:#selector(toProfileButtonClicked), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "pixel"), for: .normal)
        button.setBackgroundColor(color: VKColorForDifStates ?? .systemBlue, forState: [.highlighted, .selected, .disabled])
        button.layer.masksToBounds = true
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.toAutoLayout()
        return scrollView
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
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    @objc func toProfileButtonClicked() {
        self.navigationController?.pushViewController(profileController, animated: true)
    }
    
    func registerForKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2
            }
        }
    }
    
    @objc private func keyboardHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func tapToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
