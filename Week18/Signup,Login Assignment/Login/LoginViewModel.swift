//
//  LoginViewModel.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/03.
//

import Foundation
import RxSwift

class LoginViewModel {
    let login = PublishSubject<Login>()
    
    func requestLogin(email: String, password: String) {
        let api = SeSACAPI.login(email: email, password: password)
        Network.shared.requestSeSAC(type: Login.self, url: api.url, method: .post, parameters: api.parameter, headers: api.headers, completion: { [weak self] response in
            switch response {
            case .success(let success):
                self?.login.onNext(success)
                UserDefaults.standard.set(success.token, forKey: "token")
            case .failure(let failure):
                self?.login.onError(failure)
            }
        })
    }
}

