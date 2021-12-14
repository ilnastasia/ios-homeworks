//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasia Ilina on 14.12.2021.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {
    
    var profileHeadView : ProfileHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .lightGray
        navigationItem.title = "Мой профиль"
        
        profileHeadView = ProfileHeaderView()
        view.addSubview(profileHeadView!)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeadView!.frame = view.frame
    }
    
    
    
    
}
