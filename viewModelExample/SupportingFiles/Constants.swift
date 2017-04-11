//
//  Constants.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 3/15/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

let host = "https://api.vk.com/method"

let VKAppID      = "5005882"
let APIRedirectURI = "https://oauth.vk.com/blank.html"
let VKAPIVersion = "5.63"

enum URLParameterKey: String {
    case additionalPath = "additionalUrlPath"
}

enum PermissionUser: Int {
    case notiify  = 1
    case frinds   = 2
    case photos   = 4
    case audio    = 8
    case video    = 16
    case pages    = 128 //access to wiki pages
    case applicationLink = 256 //acces to add application link
    case status   = 1024
    case notes    = 2048
    case messages = 4096
    case wall     = 8192 // ignored by API
    case ads      = 32768
    case offline  = 65536
    case docs     = 131072
    case groups   = 262144
    case notifications = 524288
    case stats    = 1048576
    case email    = 4194304 // acces to user email
    case market   = 134217728
    
    static func scope(with permissions:[PermissionUser]) -> Int {
        var scopeResult = 0
        for permisson in permissions {
            scopeResult += permisson.rawValue
        }
        return scopeResult
    }
}
