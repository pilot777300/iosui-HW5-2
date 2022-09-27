//
//  LogInViewController.swift
//  NavigTest
//
//  Created by Mac on 15.08.2022.
//

import UIKit

class LogInViewController: UIViewController {
 
    private lazy var scrollView: UIScrollView = {
     let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var logo: UIImageView = {
       let logo = UIImageView()
        logo.backgroundColor = .white
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private lazy var email: UITextField = {
    let email = UITextField()
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
        email.keyboardType = UIKeyboardType.default
        email.clearButtonMode = UITextField.ViewMode.whileEditing
        email.returnKeyType = UIReturnKeyType.done
      //  self.view.endEditing(true)
        email.resignFirstResponder()
        return email
    }()
    
    private lazy var password: UITextField = {
        let password = UITextField()
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        password.placeholder = "Password"
        password.font = UIFont.systemFont(ofSize: 15)
        password.backgroundColor = .systemGray6
        password.keyboardType = UIKeyboardType.default
        password.translatesAutoresizingMaskIntoConstraints = false
        password.clipsToBounds = true
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        password.isSecureTextEntry = true
        return password
    }()
    
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(named: "MyColor")
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.layer.masksToBounds = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return loginButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGestures()
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
       // self.stackView.addArrangedSubview(logo)
        self.stackView.addArrangedSubview(email)
        self.stackView.addArrangedSubview(password)
        self.stackView.addArrangedSubview(loginButton)
        let scrollViewConstraints = self.scrollViewConstraints()
        NSLayoutConstraint.activate(scrollViewConstraints)
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        view.addSubview(logo)
        setConstraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
    private func setGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func scrollViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingAnchor = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingAnchor = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomAnchor = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        return [
            topAnchor, leadingAnchor, trailingAnchor, bottomAnchor
        ]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let centerYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
        let heightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 180)
        
        return [
            centerYConstraint, leadingConstraint, trailingConstraint, heightConstraint
        ]
    }
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    @objc func loginButtonPressed(sender: UIButton) {
        let profileViewController = ProfileViewController()
       self.navigationController?.pushViewController(profileViewController, animated: true)
   }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
     NSLayoutConstraint.activate([
        logo.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
       logo.widthAnchor.constraint(equalToConstant: 100),
       logo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 120.0),
       logo.heightAnchor.constraint(equalToConstant: 100),
        
        email.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
        email.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 80),
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
        loginButton.heightAnchor.constraint(equalToConstant: 50),

     ])
    
    }
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            self.view.frame.origin.y = -35
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}



 




