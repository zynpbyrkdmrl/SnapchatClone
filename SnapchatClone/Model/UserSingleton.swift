//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Zeynep Bayrak Demirel on 15.07.2023.
//

import Foundation

class UserSingleton {
    
    //kendimiz bir tane obje oluşturuyoruz.
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    //kimse obje oluşturamayacak bu sınıftan.
    private init () {
        
    }
}
