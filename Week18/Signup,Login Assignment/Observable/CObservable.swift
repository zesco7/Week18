//
//  CObservable.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/05.
//

import Foundation

class CObservable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: (T)) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
