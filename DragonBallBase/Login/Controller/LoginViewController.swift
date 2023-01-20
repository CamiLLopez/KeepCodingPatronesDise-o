//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by Camila Laura Lopez on 17/1/23.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    var mainView: LoginView {self.view as! LoginView}
    
    var viewModel: LoginViewModel?
    var loginButton: UIButton?
    var passwordTextField: UITextField?
    var emailTextField: UITextField?
    var messageView: UILabel?
    var login: String?
    
    override func loadView() {
        
        let loginView = LoginView()
                
        loginButton = loginView.getLoginButtonView()
        emailTextField = loginView.getEmailView()
        passwordTextField = loginView.getPasswordView()
        messageView = loginView.getMessageView()
                
        view = loginView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel()
        
        loginButton?.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
        
    }
    
    func setUpUpdateUI(){
        viewModel = LoginViewModel()
        
        viewModel?.updateLogin = { [weak self] login in
            self?.login = login
            self?.messageView?.text = login
            
            print(login)
        }
    }
    
    func getLogin(email: String, password: String){

        viewModel?.fetchLogin(email: email , password: password)
        
    }
 
    @objc func didLoginTapped(sender: UIButton!) {
        
        guard let email = emailTextField?.text,
        !email.isEmpty else {
            print("email is empty")
         return
         }
        guard let password = passwordTextField?.text, !password.isEmpty else {
         print("Password is empty")
         return
         }
        
        self.getLogin(email: email.lowercased(), password: password)
        setUpUpdateUI()
    }
}





