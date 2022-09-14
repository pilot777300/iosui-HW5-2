//
//  ProfileHeaderView.swift
//  NavigTest
//
//  Created by Mac on 18.07.2022.
//

import UIKit


class ProfileHeaderView: UIView {
   
   private  lazy var profileView = UIImageView()
    private  lazy var name = UILabel ()
    private  lazy var setStatus = UITextField ()
    private  lazy var changeStatusButton = UIButton()
    private  lazy var status = UILabel()
    private  lazy var newButton = UIButton()
    private  lazy var changedText: String = ""

      override init(frame: CGRect){
        super.init(frame: frame)
        
        profileView.backgroundColor = .gray
        profileView.image = UIImage(named: "A330-300.jpg")
        profileView.layer.borderColor = UIColor.white.cgColor
        profileView.layer.borderWidth = 3.0
        profileView.layer.cornerRadius = 50
        profileView.layer.masksToBounds = true
          profileView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileView)
          
         
          name.backgroundColor = .lightGray
          name.text = "Пилот квадрокоптера"
          name.font.withSize(18)
          name.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
          name.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(name)
          
          setStatus.placeholder = "Задайте статус"
          setStatus.backgroundColor = .white
          setStatus.layer.cornerRadius = 12
          setStatus.layer.borderColor = CGColor(red: 0, green: 1, blue: 255, alpha: 9)
          setStatus.font = UIFont.systemFont(ofSize: 15)
          setStatus.keyboardType = UIKeyboardType.default
          setStatus.returnKeyType = UIReturnKeyType.done
          setStatus.clearButtonMode = UITextField.ViewMode.whileEditing;
          setStatus.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
          setStatus.addTarget(self, action: #selector(editingChanged), for: UIControl.Event.editingChanged)
          setStatus.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(setStatus)
          
          changeStatusButton.backgroundColor = .blue
          changeStatusButton.layer.cornerRadius = 4
          changeStatusButton.setTitle("Изменить статус", for: .normal)
          changeStatusButton.setTitleColor(.white, for: .normal)
          changeStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          changeStatusButton.layer.shadowRadius = 4
          changeStatusButton.layer.shadowColor = UIColor.black.cgColor
          changeStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
          changeStatusButton.layer.shadowOpacity = 0.7
          changeStatusButton.layer.masksToBounds = false
          changeStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
          changeStatusButton.isUserInteractionEnabled = true
          changeStatusButton.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(changeStatusButton)
          
          status.backgroundColor = .lightGray
          status.text = "Ожидаю лучших времен"
          status.textColor = .gray
          status.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(status)
          
          newButton.backgroundColor = .blue
          newButton.layer.cornerRadius = 4
          newButton.setTitle("Новая кнопка", for: .normal)
          newButton.setTitleColor(.white, for: .normal)
          newButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          newButton.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(newButton)
       
          setupConstrains()
}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      private  func setupConstrains() {
             let safeArea = self.safeAreaLayoutGuide
          NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16.0),
            profileView.widthAnchor.constraint(equalToConstant: 100),
            profileView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16.0),
            profileView.heightAnchor.constraint(equalToConstant: 100),
            
            name.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 137),
            name.widthAnchor.constraint(equalToConstant: 250),
            name.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 17),
            name.heightAnchor.constraint(equalToConstant: 25),
            
            setStatus.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 137),
            setStatus.widthAnchor.constraint(equalToConstant: 200),
            setStatus.heightAnchor.constraint(equalToConstant: 40),
            setStatus.bottomAnchor.constraint(equalTo: changeStatusButton.topAnchor, constant: -10),
            
            changeStatusButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            changeStatusButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16.0),
            changeStatusButton.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 16),
            changeStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            status.bottomAnchor.constraint(equalTo: setStatus.topAnchor, constant: -8),
            status.heightAnchor.constraint(equalToConstant: 20),
            status.widthAnchor.constraint(equalToConstant: 250),
            status.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 137),
            
            newButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        
          ])
        
    }
    @objc func editingChanged(textField: UITextField) {
        changedText = setStatus.text!
    }
    @objc func buttonPressed(sender: UIButton) {
        status.text = changedText
    }

}

