//
//  Network.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/03.
//

import Foundation
import Alamofire

final class Network {
    static let shared = Network()
    
    private init() { }
    
    //method: HTTPMethod = .get: 자주 사용할 요소 또는 필요한 부분은 기본값 설정해도 괜찮음
    //requestSeSAC<T: Decodable>: 디코딩 가능한 요소만 받을 수 있도록 제네릭 제약설정
    //Result<T, Error>: completion 타입이 옵셔널이면 nil을 받을 수 있기 때문에 둘 다 성공하거나 둘 다 실패하는 케이스까지 클로저로 대응해야 함. 성공, 실패 두 개 케이스만 대응하기 위해 Result사용
    //네트워크 통신했을때 각기 다른 응답값을 처리하기 위해 클로저 사용(성공, 실패 케이스)
    func requestSeSAC<T: Decodable>(type: T.Type = T.self, url: URL, method: HTTPMethod = .get, parameters: [String:String]? = nil, headers: HTTPHeaders, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url, method: method, parameters: parameters,headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                //알라모파이어에서 보내는 statusCode 대신 지역변수로 선언한 statusCode 사용
                guard let statusCode = response.response?.statusCode else { return }
                guard let error = SeSACError(rawValue: statusCode) else { return }
                
                completion(.failure(error))
            }
        }
    }
    
    func requestString(url: URL, method: HTTPMethod = .get, parameters: [String:String]? = nil, headers: HTTPHeaders, completion: @escaping (Result<String, Error>) -> Void) {
        AF.request(url, method: method, parameters: parameters,headers: headers).responseString(completionHandler: { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                //알라모파이어에서 보내는 statusCode 대신 지역변수로 선언한 statusCode 사용
                guard let statusCode = response.response?.statusCode else { return }
                guard let error = SeSACError(rawValue: statusCode) else { return }
                
                completion(.failure(error))
            }
        })
    }
}
