
import Foundation
import UIKit

class ProfileViewController: UIViewController, TapViewDelegate {
    
    let profileHeader = ProfileHeaderView()
    let userService: UserService
    let name: String
    
    init(userService: UserService, name: String) {
        self.userService = userService
        self.name = name
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate enum CellReuseIdentifiers: String {
        case postInfo = "PostCellReuse"
        case photos = "Photos"
    }
    
    fileprivate enum HeaderFooterReuseIdentifiers: String {
        case headerID = "HeaderViewReuse"
    }

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.postInfo.rawValue)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.photos.rawValue)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderFooterReuseIdentifiers.headerID.rawValue)
        return tableView
    }()
    
    let backgroundAnimationView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .clear
        return view
    }()

    let backgroundAnimationViewButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setBackgroundImage(UIImage(systemName: "multiply"), for: .normal)
        button.tintColor = .black
        button.alpha = 0.0
        button.addTarget(self, action: #selector(tapReturnButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileHeader.delegate = self
        
        #if DEBUG
        view.backgroundColor = .systemGray6
        #else
        view.backgroundColor = .red
        #endif
        
        view.addSubviews(tableView)
        setupTableView()
    }
    
    @objc func viewDidTapAvatar() {
        //print("avatar tapped")
        self.view.addSubview(self.backgroundAnimationView)
        self.backgroundAnimationView.addSubviews(self.backgroundAnimationViewButton)
        setupAnimateViews()
        
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.backgroundAnimationView.backgroundColor = .white
                self.backgroundAnimationView.alpha = 0.5
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                self.backgroundAnimationViewButton.alpha = 1.0
            }
        })
    }
    
    @objc func tapReturnButton() {
        let startCenter = profileHeader.avatarView.center
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, animations: {
            self.backgroundAnimationView.alpha = 0.0
            self.profileHeader.avatarView.transform = CGAffineTransform.identity
            self.profileHeader.avatarView.center = startCenter
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupAnimateViews() {
        NSLayoutConstraint.activate([
            backgroundAnimationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundAnimationView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            backgroundAnimationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            backgroundAnimationView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            
            backgroundAnimationViewButton.topAnchor.constraint(equalTo: backgroundAnimationView.topAnchor, constant: 16),
            backgroundAnimationViewButton.rightAnchor.constraint(equalTo: backgroundAnimationView.rightAnchor, constant: -16),
            backgroundAnimationViewButton.widthAnchor.constraint(equalToConstant: 50),
            backgroundAnimationViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell1: PhotosTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseIdentifiers.photos.rawValue,
                for: indexPath
            ) as? PhotosTableViewCell else {
                fatalError()
            }
            
            return cell1
        } else {
            guard let cell2: PostTableViewCell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseIdentifiers.postInfo.rawValue,
                for: indexPath
            ) as? PostTableViewCell else {
                fatalError()
            }
            
            let post = postInfo[indexPath.row]
            cell2.update(with: post)
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postInfo.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let profileHeaderView = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: "HeaderViewReuse")
            as! ProfileHeaderView
            profileHeaderView.tintColor = .systemGray6
            view.addSubviews(profileHeaderView)
            
            let myUser = userService.userHandler(name: name)
            profileHeaderView.nameView.text = myUser?.fullName
            profileHeaderView.avatarView.image = myUser?.avatar
            profileHeaderView.descriptionView.text = myUser?.status

            return profileHeaderView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        } else {
            return 0
        } 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosViewController = PhotosViewController()
        if indexPath.section == 0 {
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
}
