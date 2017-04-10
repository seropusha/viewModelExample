//
//  UserService.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import KeychainSwift

private let authTokenDataKey = "authTokenKeychain"
private let appLanguageKey   = "languageKey"

enum Language: String {
    case russia   = "ru"
    case urkaine  = "ua"
    case belarous = "be"
    case english  = "en"
    case spain    = "es"
    case finland  = "fi"
    case deutsch  = "de"
    case italia   = "it"
}

struct UsersService {
    //static var currentUser  = User()
    
    static let userDefault = UserDefaults.standard
    
    static func isHaveActiveToken() -> Bool {
        guard let token = authToken(), token.expiresIn.compare(Date()) == .orderedAscending else {
            return false
        }
        return true
    }
    
    //MARK: - Selected Language -
    
    static func appLanguage() -> Language {
        if let selectedLangugage = userDefault.object(forKey: appLanguageKey) as? String {
            return Language(rawValue: selectedLangugage)!
        } else {
            return Language.russia
        }
    }
    
    static func setupAppLanguage(with language: Language) -> Bool {
        userDefault.set(language.rawValue, forKey: appLanguageKey)
        return userDefault.synchronize()
    }
    
    //MARK: - Authorization Token -
    
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
