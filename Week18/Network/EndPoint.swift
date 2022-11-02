//
//  EndPoint.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import Foundation
import Alamofire

enum SeSACAPI {
    case signup(userName: String, email: String, password: String)
    case login(email: String, password: String)
    case profile
}

extension SeSACAPI {
    var url: URL {
        switch self {
        case .signup:
            return URL(string: "http://api.memolease.com/api/v1/users/signup")!
        case .login:
            return URL(string: "http://api.memolease.com/api/v1/users/login")!
        case .profile:
            return URL(string: "http://api.memolease.com/api/v1/users/me")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .signup, .login:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        case .profile:
            return ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token")!)",
            "Content-Type": "application/x-www-form-urlencoded"]
        }
    }
    
    var parameter: [String: String] {
        switch self {
        case .signup(userName: let userName, email: let email, password: let password):
            return ["userName": userName,
             "email": email,
             "password": password]
        case .login(email: let email, password: let password):
            return ["email": email,
             "password": password]
        default: return ["": ""]
        }
    }
}
