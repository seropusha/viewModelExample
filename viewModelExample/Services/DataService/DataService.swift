//
//  DataService.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import KeychainSwift

private let authTokenKey = "authToken"

struct DataService {
    
    //MARK: - Auth token -
    
    static func authToken() -> String? {
        let keychain = KeychainSwift()
        return keychain.get(authTokenKey)
    }
    
    static func setAuth(token: String?) {
        let keychain = KeychainSwift()
        if let tkn = token {
            keychain.set(tkn, forKey: authTokenKey)
        } else {
            keychain.delete(authTokenKey)
        }
    }
}
