//
//  ProfileView.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import Foundation
import UIKit

class ProfileView: BaseView {
    let profileTitleLabel : CustomTitleLabel = { //객체 생성
        let view = CustomTitleLabel()
        view.text = "프로필 화면"
        return view
    }()
    
    let emailLabel : CustomLabel = {
        let view = CustomLabel()
        view.text = "이메일"
        return view
    }()
    
    let nameLabel : CustomLabel = {
        let view = CustomLabel()
        view.text = "이름"
        return view
    }()
    
    let logoutButton : UIButton = {
        let view = UIButton()
        view.layer.backgroundColor = UIColor.systemRed.cgColor
        view.layer.cornerRadius = 5
        view.setTitle("로그아웃", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        return view
    }()
    
    override func configureUI() { //객체 등록
        [profileTitleLabel, emailLabel, nameLabel, logoutButton].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        profileTitleLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(200)
            make.height.lessThanOrEqualTo(100)
            make.centerX.equalTo(self)
            make.centerY.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leadingMargin.equalTo(50)
            make.trailingMargin.equalTo(-50)
            make.top.equalTo(profileTitleLabel.snp.bottom).offset(80)
            make.height.equalTo(44)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leadingMargin.equalTo(50)
            make.trailingMargin.equalTo(-50)
            make.top.equalTo(nameLabel.snp.bottom).offset(22)
            make.height.equalTo(44)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.leadingMargin.equalTo(100)
            make.trailingMargin.equalTo(-100)
            make.top.equalTo(emailLabel.snp.bottom).offset(22)
            make.height.equalTo(33)
        }
    }
}
