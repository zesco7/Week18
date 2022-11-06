//
//  APIService.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import Foundation
import Alamofire

struct Login: Codable {
    let token: String
}

struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

//상태코드, 에러 안내메시지
enum SeSACError: Int, Error {
    case invalidAuthorization = 401
    case takenEmail = 406
    case emptyParameters = 501
}

extension SeSACError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidAuthorization:
            return "토큰이 만료되었습니다. 다시 로그인 해주세요"
        case .takenEmail:
            return "이미 가입된 회원입니다. 로그인 해주세요"
        case .emptyParameters:
            return "머가 없습니다"
        }
    }
}

class APIService {
    func signup(userName: String, email: String, password: String) {
        let api = SeSACAPI.signup(userName: userName, email: email, password: password)
        //let api = SeSACAPI.signup(userName: "testTJ", email: "testTJ@test.com", password: "12345678")
        AF.request(api.url, method: .post, parameters: api.parameter, headers: api.headers).responseString { response in
            print(response)
            print(response.response?.statusCode)
        }
    }
//
//    //로그인 성공하면 발급되는 토큰을 ud에 저장해서 사용자정보 헤더에 포함시킴
//    func login() {
//        let api = SeSACAPI.login(email: "testTJ@test.com", password: "12345678")
//        AF.request(api.url, method: .post, parameters: api.parameter, headers: api.headers).validate(statusCode: 200...299).responseDecodable(of: Login.self) { response in
//            switch response.result {
//            case .success(let data):
//                print(data.token) //통신성공하면 디코딩한 내용으로 출력 가능
//                UserDefaults.standard.set(data.token, forKey: "token") //프로필정보 헤더에 넣어주기 위해 토큰값 저장
//            case .failure(_):
//                print(response.response?.statusCode)
//            }
//        }
//    }
//
//    func profile() {
//        let api = SeSACAPI.profile
//        let header: HTTPHeaders = SeSACAPI.profile.headers
//        AF.request(api.url, method: .get, headers: api.headers).responseDecodable(of: Profile.self) { response in
//            switch response.result {
//            case .success(let data):
//                print(data)
//            case .failure(_):
//                print(response.response?.statusCode)
//            }
//        }
//    }
}
