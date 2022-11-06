//
//  ViewController.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import UIKit
import RxSwift

//표시화면: 프로필화면
class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let phone = Phone() //구조체 내 프로퍼티에 접근을 하지 않고 값을 바로 가져올 수 있음
        print(phone.numbers[2])
        print(phone[2])
        
        viewModel.profile
            .withUnretained(self)
            .subscribe { (vc, value) in
                vc.label.text = value.user.email
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposeBag)
        
        viewModel.getProfile()
        
        checkCOW()
    }
    
    //Copy on Write(값타입이어도 참조하는 경우): 컬렉션타입(array, dic, set)은 실제로 값이 바뀔때만 메모리가 달라짐(성능 최적화)
    func checkCOW() {
        var test = "jack"
        address(&test) //in out매개변수: 변수앞에 &사용하는 매개변수
        
        print(test[2]) //"c" 반환
        print(test[200]) //nil 반환(subscript guard(0..<count).contains(idx) else { return nil } 조건에 따라)
        var test2 = test
        address(&test2) //기본자료형 값타입인 구조체를 넣으면 메모리 주소가 바뀜(당연)
        
        test2 = "sesac"
        address(&test)
        address(&test2)
        
        print("===========")
        
        var array = Array(repeating: "A", count: 100)
        address(&array)
        
        var newArray = array
        address(&newArray) //컬렉션타입(array, dic, set)인 구조체를 넣어도 메모리 주소가 안바뀜(실제로 값을 복사안하고 원본을 공유함)
        
        newArray[0] = "B"
        
        address(&array)
        address(&newArray) //값이 바뀌었을때만 메모리 주소가 바뀜
    }
    
    func address(_ value: UnsafeRawPointer) {
        let address = String(format: "%p", Int(bitPattern: value))
        print(address)
    }
}

