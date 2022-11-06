//
//  LoginViewController.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import UIKit
import RxSwift

class LoginViewController: BaseViewController {
    
    let viewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    let mainView = LoginView()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        mainView.buttonToSignup.addTarget(self, action: #selector(buttonToSignupClicked), for: .touchUpInside)
        mainView.passwordTextField.isSecureTextEntry = true
        
    }
    
    @objc func loginButtonClicked() {
        viewModel.login
            .withUnretained(self)
            .subscribe { (vc, value) in
                print(value)
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        viewModel.requestLogin(email: mainView.emailTextField.text!, password: mainView.passwordTextField.text!)
        navigationPush()
    }
    
    @objc func buttonToSignupClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigationPush() {
        let navi = UINavigationController(rootViewController: LoginViewController())
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
