//
//  CustomLabel.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/03.
//

import Foundation
import UIKit

class CustomTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.font = .systemFont(ofSize: 20, weight: .bold)
        self.textColor = .black
    }
}
