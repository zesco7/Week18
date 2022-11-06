//
//  SignupViewModel.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/03.
//

import Foundation
import RxSwift

class SignupViewModel {
    let signup = PublishSubject<String>()
    
    func requestSignup(userName: String, email: String, password: String) {
        let api = SeSACAPI.signup(userName: userName, email: email, password: password)
        Network.shared.requestString(url: api.url, method: .post, parameters: api.parameter, headers: api.headers) { [weak self] response in
            switch response {
            case .success(let success):
                self?.signup.onNext(success)
            case .failure(let failure):
                self?.signup.onError(failure)
            }
        }
    }
}
