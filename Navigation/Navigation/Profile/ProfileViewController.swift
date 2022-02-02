
import Foundation
import UIKit

class ProfileViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviews(tableView)
        setupTableView()
        setupNavigationController()
    }
    
    func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Мой профиль"
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
            
            let data = postInfo[indexPath.row]
            cell2.update(author: data.author, description: data.description, image: data.image, likes: data.likes, views: data.views)
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
}
