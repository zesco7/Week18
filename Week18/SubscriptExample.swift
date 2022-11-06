//
//  SubscriptExample.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/03.
//

import Foundation

extension String {
    
    //반환값 옵셔널인 이유? 문자열 길이가 짧은 경우 커버 (ex. jack 4글자인데 [10]인 경우 10번째 글자가 없어서 에러 발생하는 것 방지)
    subscript(idx: Int) -> String? {
        guard(0..<count).contains(idx) else {
            return nil
        }
        let result = index(startIndex, offsetBy: idx) //몇번째 글자부터, 얼마나 이동하는지
        return String(self[result])
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}



//Phone[1]이 numbers[1]이 되도록?
struct Phone {
    var numbers = ["1234", "5678", "3345", "2222"]
    
    subscript(idx: Int) -> String {
        get {
            return self.numbers[idx]
        }
        set {
            self.numbers[idx] = newValue
        }
    }
}
