
import UIKit

class PostTableViewCell: UITableViewCell {
    var values: Values?
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont(name: "Helvetica-Bold", size : 20)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    let postImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        view.image = UIImage(named: "corona")
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label  = UILabel()
        label.toAutoLayout()
        label.font = UIFont(name: "Helvetica-Regular", size : 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont(name: "Helvetica-Regular", size : 16)
        label.textColor = .black
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont(name: "Helvetica-Regular", size : 16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubviews(authorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(author: String, description: String, image: String, likes: Int, views: Int) {
        authorLabel.text = author
        postImageView.image = UIImage(named: image)
        descriptionLabel.text = description
        likesLabel.text = "Likes: " + String(likes)
        viewsLabel.text = "Views: " + String(views)
    }
    
    func setupViews() {
        values = Values()
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: values?.screenWidth ?? 0),
            postImageView.widthAnchor.constraint(equalToConstant: values?.screenWidth ?? 0)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        contentView.heightAnchor.constraint(equalTo: descriptionLabel.heightAnchor, constant: (values?.screenWidth ?? 0) + 120).isActive = true
    }
}
