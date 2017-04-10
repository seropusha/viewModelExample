//
//  URLRequest+AccessToken.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/10/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

private let accessTokenKey = "access_token"
private let expiresInKey = "expires_in"
private let user_id      = "user_id"

extension URLRequest {
    
    func isHasAccessToken() -> Bool {
        guard let URLString = url?.absoluteString else { return false }
        return URLString.contains(accessTokenKey)
    }
    
    func parseAccessToken() -> VKToken? {
        guard let URLString = url?.absoluteString else { return nil }
        guard let paramsString = URLString.components(separatedBy: "#").last else { return nil }
        let params = paramsString.components(separatedBy: "&")
        let tokenObject = VKToken()
        for string in params {
            if string.contains(accessTokenKey) {
                tokenObject.token = string.components(separatedBy: "=").last ?? ""
            }
            if string.contains(expiresInKey) {
                if let expiresInString = string.components(separatedBy: "=").last {
                    let expiresInDate = Date(timeIntervalSinceNow: TimeInterval(expiresInString) ?? 0)
                    tokenObject.expiresIn = expiresInDate
                }
            }
            if string.contains(user_id) {
                if let userIDString = string.components(separatedBy: "=").last {
                    tokenObject.userID = Int(userIDString) ?? 0
                }
            }
        }
        return tokenObject
    }
}
