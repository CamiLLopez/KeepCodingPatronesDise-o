//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Camila Laura Lopez on 18/1/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    //Create header view
    var buttonHandler: (() -> Void)?
    
    let headerLabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let passwordTextField = {
        let textField = UITextField()
        textField.placeholder = "Insert your password"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
   
    let emailTextField = {
        let textField = UITextField()
        textField.placeholder = "Insert your email"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        //Create app views
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func loginAction(sender: UIButton!) {
              print("Button Clicked")
              buttonHandler?()
         }
  
    func setUpViews(){
        backgroundColor = .systemGray6
        
        
        addSubview(headerLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
       NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
        
            
            emailTextField.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 250),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 30),
        
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 60),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 80),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            loginButton.heightAnchor.constraint(equalToConstant: 30),
            loginButton.widthAnchor.constraint(equalToConstant: 20)
       
       ])
        
    }
    
}


