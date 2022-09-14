//
//  ProfileViewController.swift
//  NavigTest
//
//  Created by Mac on 08.07.2022.
//

import UIKit


class ProfileViewController: UIViewController {
 
   var profile: ProfileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        //profile = ProfileHeaderView()
        self.view.addSubview(profile)
        profile.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
  private  func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profile.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            profile.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
             profile.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            profile.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profile.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

}


