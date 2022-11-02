//
//  ViewController.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {

    let api = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //api.login()
        api.profile()
    }
}

