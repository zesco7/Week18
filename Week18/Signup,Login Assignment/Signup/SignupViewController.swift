//
//  SignupViewController.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import UIKit
import RxSwift

class SignupViewController: BaseViewController {
    
    let viewModel = SignupViewModel()
    let disposeBag  = DisposeBag()
    
    let mainView = SignupView()
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.signupButton.addTarget(self, action: #selector(signupButtonClicked), for: .touchUpInside)
        mainView.passwordTextField.isSecureTextEntry = true
    }
    
    @objc func signupButtonClicked() {
        viewModel.signup
            .withUnretained(self)
            .subscribe { (vc, value) in
                print(value)
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        
        viewModel.requestSignup(userName: mainView.nameTextField.text!, email: mainView.emailTextField.text!, password: mainView.passwordTextField.text!)
        alert()
    }
    
    func resetTextField() {
        mainView.nameTextField.text = ""
        mainView.emailTextField.text = ""
        mainView.passwordTextField.text = ""
    }
    
    func alert() {
        let alert = UIAlertController(title: "회원가입이 완료되었습니다.", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { action in
            self.navigationPush()
            self.resetTextField()
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func navigationPush() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
