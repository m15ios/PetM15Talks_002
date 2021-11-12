//
//  AppStorage.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 12.11.2021.
//

import Foundation

class AppStorage {
    
    var appStates = UserDefaults.standard

    // to use: AppStorage.hole().getUserAuth()
    func getUserAuth() -> Bool {

        let userAuth = appStates.object(forKey: "userAuth") as? Bool ?? false
    
        return userAuth
    }
    
    static var appStorage: AppStorage?
   
    static func hole() -> AppStorage {
        
        if( AppStorage.appStorage == nil ){
            AppStorage.appStorage = AppStorage()
        }
        
        return AppStorage.appStorage!
    }
    
}

