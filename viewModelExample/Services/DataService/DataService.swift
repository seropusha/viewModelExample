//
//  DataService.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import KeychainSwift

private let authTokenDataKey = "authTokenData"

struct DataService {
    
    //MARK: - Auth token -
    
    static func authToken() -> VKToken? {
        let keychain = KeychainSwift()
        if let data = keychain.getData(authTokenDataKey){
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? VKToken
        }
        return nil
    }
    
    static func setAuth(token: VKToken?) {
        let keychain = KeychainSwift()
        if let tkn = token {
            let data = NSKeyedArchiver.archivedData(withRootObject: tkn)
            keychain.set(data, forKey: authTokenDataKey)
        } else {
            keychain.delete(authTokenDataKey)
        }
    }
}
