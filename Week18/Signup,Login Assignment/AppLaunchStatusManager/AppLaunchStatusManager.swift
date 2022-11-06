//
//  AppLaunchStatusManager.swift
//  Week18
//
//  Created by Mac Pro 15 on 2022/11/06.
//

import Foundation

public class AppLaunchStatusManager {
    static var shared = AppLaunchStatusManager()
    
    func checkTokenExist() {
        if UserDefaults.standard.object(forKey: "token") == nil {
            UserDefaults.standard.set("NOT FIRST RUN", forKey: "checkIsFirstRun")
            print(UserDefaults.standard.object(forKey: "checkIsFirstRun")!)
        } else {
            print(UserDefaults.standard.object(forKey: "checkIsFirstRun")!)
        }
    }
}
