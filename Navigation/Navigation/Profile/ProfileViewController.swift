
import Foundation
import UIKit

class ProfileViewController: UIViewController {

    fileprivate enum CellReuseIdentifiers: String {
        case postInfo = "PostCellReuse"
    }
    
    fileprivate enum HeaderFooterReuseIdentifiers: String {
        case headerID = "HeaderViewReuse"
    }

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.postInfo.rawValue)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderFooterReuseIdentifiers.headerID.rawValue)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "Мой профиль"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubviews(tableView)
        setupViews()
    }
    
    func setupViews() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseIdentifiers.postInfo.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError()
        }
        
        let data = postInfo[indexPath.row]
        cell.update(author: data.author, description: data.description, image: data.image, likes: data.likes, views: data.views)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postInfo.count
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileHeaderView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "HeaderViewReuse")
        as! ProfileHeaderView
        profileHeaderView.tintColor = .systemGray6
        view.addSubviews(profileHeaderView)
        return profileHeaderView  
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}
