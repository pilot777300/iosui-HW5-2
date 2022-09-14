//
//  LoginView.swift
//  NavigTest
//
//  Created by Mac on 15.08.2022.
//

import UIKit

class LoginView: UIView {

    lazy var logo = UIImageView()
    lazy var email = UITextField()
    lazy var password = UITextField()
    lazy var loginButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        logo.backgroundColor = .white
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logo)
        
        email.layer.borderWidth = 0.5
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.placeholder = "e-mail"
        email.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        email.backgroundColor = .systemGray6
        email.font = UIFont.systemFont(ofSize: 15)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.clipsToBounds = true
        email.layer.cornerRadius = 10
        email.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.addSubview(email)
        
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        password.placeholder = "Password"
        password.font = UIFont.systemFont(ofSize: 15)
        password.backgroundColor = .systemGray6
        password.translatesAutoresizingMaskIntoConstraints = false
        password.clipsToBounds = true
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        password.isSecureTextEntry = true
        self.addSubview(password)
        
        loginButton.backgroundColor = UIColor(named: "MyColor")
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.layer.masksToBounds = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        self.addSubview(loginButton)
        
        constraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        let safeArea = self.safeAreaLayoutGuide
     NSLayoutConstraint.activate([
        logo.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
       logo.widthAnchor.constraint(equalToConstant: 100),
       logo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 120.0),
       logo.heightAnchor.constraint(equalToConstant: 100),
        
        email.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        email.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
        email.heightAnchor.constraint(equalToConstant: 50),
        email.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        email.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
      
        password.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        password.topAnchor.constraint(equalTo: email.bottomAnchor),
        password.heightAnchor.constraint(equalToConstant: 50),
        password.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        password.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
      
        loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 16),
        loginButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
        loginButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
        loginButton.heightAnchor.constraint(equalToConstant: 50)
        
     ])
    }
    
    @objc func loginButtonPressed(sender: UIButton) {
        _ = ProfileViewController()

    }
}

