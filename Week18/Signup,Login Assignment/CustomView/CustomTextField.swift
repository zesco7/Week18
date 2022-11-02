//
//  CustomTextField.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/03.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    func setupView(_ placeholder: String) {
    //        self.layer.backgroundColor = UIColor.white.cgColor
    //        self.layer.cornerRadius = 5
    //        self.placeholder = placeholder
    //        self.textColor = .black
    //    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 5
        self.textColor = .black
    }
}
