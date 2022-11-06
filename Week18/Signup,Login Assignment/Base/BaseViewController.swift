//
//  BaseViewController.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5

        configure()
        setConstraints()
        hideKeyboard()
       
    }
    
    func configure() { }
    
    func setConstraints() { }
    
    func hideKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
