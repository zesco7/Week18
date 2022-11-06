//
//  ProfileViewController.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import UIKit
import RxSwift

class ProfileViewController: BaseViewController {
    
    let viewModel = ProfileViewModel()
    let disposeBag  = DisposeBag()
    let mainView = ProfileView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.logoutButton.addTarget(self, action: #selector(logoutButtonClicked), for: .touchUpInside)
        viewModel.profile
            .withUnretained(self)
            .subscribe { (vc, value) in
                vc.mainView.nameLabel.text = value.user.username
                vc.mainView.emailLabel.text = value.user.email
            }
        viewModel.requestProfile()
    }
    
    @objc func logoutButtonClicked() {
        UserDefaults.standard.removeObject(forKey: "token")
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let vc = SignupViewController()
        let navi = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.rootViewController = navi
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}
