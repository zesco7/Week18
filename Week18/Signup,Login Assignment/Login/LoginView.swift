//
//  LoginView.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import Foundation
import UIKit

class LoginView: BaseView {
    let loginTitleLabel : CustomTitleLabel = { //객체 생성
        let view = CustomTitleLabel()
        view.text = "로그인 화면"
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
    
    let loginButton : UIButton = {
        let view = UIButton()
        view.layer.backgroundColor = UIColor.systemBlue.cgColor
        view.layer.cornerRadius = 5
        view.setTitle("로그인", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        return view
    }()
    
    let buttonToSignup : UIButton = {
        let view = UIButton()
        view.layer.backgroundColor = UIColor.systemOrange.cgColor
        view.layer.cornerRadius = 5
        view.setTitle("회원가입", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        return view
    }()
    
    override func configureUI() { //객체 등록
        [loginTitleLabel, emailTextField, passwordTextField, loginButton, buttonToSignup].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        loginTitleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(200)
            make.height.lessThanOrEqualTo(100)
            make.centerX.equalTo(self)
            make.centerY.equalTo(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leadingMargin.equalTo(50)
            make.trailingMargin.equalTo(-50)
            make.top.equalTo(loginTitleLabel.snp.bottom).offset(80)
            make.height.equalTo(44)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leadingMargin.equalTo(50)
            make.trailingMargin.equalTo(-50)
            make.top.equalTo(emailTextField.snp.bottom).offset(22)
            make.height.equalTo(44)
        }
        
        loginButton.snp.makeConstraints { make in
            make.leadingMargin.equalTo(100)
            make.trailingMargin.equalTo(-100)
            make.top.equalTo(passwordTextField.snp.bottom).offset(22)
            make.height.equalTo(33)
        }
        
        buttonToSignup.snp.makeConstraints { make in
            make.leadingMargin.equalTo(120)
            make.trailingMargin.equalTo(-120)
            make.top.equalTo(loginButton.snp.bottom).offset(22)
            make.height.equalTo(22)
        }
    }
}
