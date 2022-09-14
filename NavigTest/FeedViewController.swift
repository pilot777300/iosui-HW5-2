//
//  FeedViewController.swift
//  NavigTest
//
//  Created by Mac on 08.07.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        let buttonOne = UIButton()
        buttonOne.backgroundColor = .blue
        buttonOne.layer.cornerRadius = 12
        buttonOne.setTitle("Первая кнопка", for: .normal)
        buttonOne.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonOne.addTarget(self, action: #selector(buttonOneAction), for: .touchUpInside)
        buttonOne.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonOne)
        
        let buttonTwo = UIButton()
        buttonTwo.backgroundColor = .blue
        buttonTwo.layer.cornerRadius = 12
        buttonTwo.setTitle("Вторая кнопка", for: .normal)
        buttonTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buttonTwo.addTarget(self, action: #selector(buttonTwoAction), for: .touchUpInside)
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonTwo)
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 10.0

        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    @objc private func buttonOneAction() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
            }
    
    @objc private func buttonTwoAction() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}
