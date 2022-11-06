//
//  ViewModel.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/03.
//

import Foundation
import RxSwift

class ViewModel {
    let profile = PublishSubject<Profile>()
    
    func getProfile() {
        let api = SeSACAPI.profile //열거형 SeSACAPI의 케이스 profile를 통해 extension에 switch로 정의한 값들 반환
        Network.shared.requestSeSAC(type: Profile.self, url: api.url, headers: api.headers) { [weak self] response in
            switch response {
            case .success(let success):
                self?.profile.onNext(success)
            case .failure(let failure):
                self?.profile.onError(failure)
            }
        }
    }
}
