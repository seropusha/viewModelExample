//
//  VKToken.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

private let accessTokenKey = "access_token"
private let expiresInKey = "expires_in"
private let user_id      = "user_id"

struct VKToken {
    
    var token = ""
    var expiresIn: Date!
    var userID = 0
    
    static func isHaveAccessToken(with request: URLRequest) -> Bool {
        guard let URLString = request.url?.absoluteString else { return false }
        return URLString.contains(accessTokenKey)
    }
    
    static func parse(from request: URLRequest) -> VKToken? {
        guard let URLString = request.url?.absoluteString else { return nil }
        guard let paramsString = URLString.components(separatedBy: "#").last else { return nil }
        let params = paramsString.components(separatedBy: "&")
        var tokenObject = VKToken()
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

extension VKToken: Meta {
    static func urlString(with method:Method) -> String {
        switch method {
        case .GET:
            return authVKURLString()
        case .POST:
            assert(false, "POST url string is empty")
            return ""
        }
    }
    
    private static func authVKURLString() -> String {
        return "https://oauth.vk.com/authorize?client_id=\(VKAppID)&display=page&redirect_uri=\(APIRedirectURI)&scope=friends&response_type=token&v=\(VKAPIVersion)"
    }
}

