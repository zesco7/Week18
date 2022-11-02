//
//  LoginViewController.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import UIKit

class LoginViewController: BaseViewController {
    
    let mainView = LoginView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        mainView.buttonToSignup.addTarget(self, action: #selector(buttonToSignupClicked), for: .touchUpInside)
        
    }
    
    @objc func loginButtonClicked() {
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonToSignupClicked() {
        let vc = SignupViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}
