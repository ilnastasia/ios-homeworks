
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont(name: "Helvetica-Bold", size : 24)
        label.textColor = .black
        label.text = "Фото"
        return label
    }()
    
    let imageView1: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.image = UIImage(named: "sverhi1")
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    let imageView2: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.image = UIImage(named: "dog1")
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    let imageView3: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.image = UIImage(named: "swiss1")
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    let imageView4: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.image = UIImage(named: "mandalorian1")
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    let arrowImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.image = UIImage(systemName: "arrow.forward")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubviews(nameLabel, imageView1, imageView2, imageView3, imageView4, arrowImageView)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            nameLabel.heightAnchor.constraint(equalToConstant: 27),
            nameLabel.widthAnchor.constraint(equalToConstant: 70),
            
            imageView1.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            imageView1.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            imageView1.widthAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            imageView1.heightAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            
            imageView2.topAnchor.constraint(equalTo: imageView1.topAnchor),
            imageView2.leftAnchor.constraint(equalTo: imageView1.rightAnchor, constant: 8),
            imageView2.widthAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            imageView2.heightAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            
            imageView3.topAnchor.constraint(equalTo: imageView1.topAnchor),
            imageView3.leftAnchor.constraint(equalTo: imageView2.rightAnchor, constant: 8),
            imageView3.widthAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            imageView3.heightAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            
            imageView4.topAnchor.constraint(equalTo: imageView1.topAnchor),
            imageView4.leftAnchor.constraint(equalTo: imageView3.rightAnchor, constant: 8),
            imageView4.widthAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            imageView4.heightAnchor.constraint(equalToConstant: Constants.photoSectionImageView),
            
            arrowImageView.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            arrowImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            arrowImageView.widthAnchor.constraint(equalToConstant: 30),
            arrowImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let constraint = contentView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4 + 60)
        constraint.isActive = true
        constraint.priority = UILayoutPriority.init(751)
    }
}

