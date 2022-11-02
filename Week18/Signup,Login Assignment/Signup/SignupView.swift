//
//  SignupView.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import Foundation
import UIKit

class SignupView: BaseView {
    let signinTitleLabel : CustomTitleLabel = { //객체 생성
        let view = CustomTitleLabel()
        view.text = "회원가입 화면"
        return view
    }()
    
    let nameTextField : CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "이름"
        return view
    }()
    
    let emailTextField : CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "이메일"
        return view
    }()
    
    let passwordTextField : CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "비밀번호"
        return view
    }()
    
    let signupButton : UIButton = {
        let view = UIButton()
        view.layer.backgroundColor = UIColor.systemGreen.cgColor
        view.layer.cornerRadius = 5
        view.setTitle("회원가입 완료", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        return view
    }()
    
    let buttonToLogin : UIButton = {
        let view = UIButton()
        view.layer.backgroundColor = UIColor.systemRed.cgColor
        view.layer.cornerRadius = 5
        view.setTitle("로그인 돌아가기", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        return view
    }()
    
    override func configureUI() { //객체 등록
        [signinTitleLabel, nameTextField, emailTextField, passwordTextField, signupButton, buttonToLogin].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        signinTitleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(200)
            make.height.lessThanOrEqualTo(100)
            make.centerX.equalTo(self)
            make.centerY.equalTo(100)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.leadingMargin.equalTo(50)
            make.trailingMargin.equalTo(-50)
            make.top.equalTo(signinTitleLabel.snp.bottom).offset(80)
            make.height.equalTo(44)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leadingMargin.equalTo(50)
            make.trailingMargin.equalTo(-50)
            make.top.equalTo(nameTextField.snp.bottom).offset(22)
            make.height.equalTo(44)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leadingMargin.equalTo(50)
            make.trailingMargin.equalTo(-50)
            make.top.equalTo(emailTextField.snp.bottom).offset(22)
            make.height.equalTo(44)
        }
        
        signupButton.snp.makeConstraints { make in
            make.leadingMargin.equalTo(100)
            make.trailingMargin.equalTo(-100)
            make.top.equalTo(passwordTextField.snp.bottom).offset(22)
            make.height.equalTo(33)
        }
        
        buttonToLogin.snp.makeConstraints { make in
            make.leadingMargin.equalTo(120)
            make.trailingMargin.equalTo(-120)
            make.top.equalTo(signupButton.snp.bottom).offset(22)
            make.height.equalTo(22)
        }
    }
}
