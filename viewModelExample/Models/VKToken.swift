//
//  VKToken.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

class VKToken: BaseModel {
    
}

extension VKToken: Meta {
    static func url(with method:HTTPMethod) -> String {
        switch method {
        case .get:
            return authVKURLString()
        default:
            assert(false, "empty url string")
            break
        }
        return ""
    }
    
    private static func authVKURLString() -> String {
        return "https://oauth.vk.com/authorize?client_id=\(VKAppID)&display=page&redirect_uri=\(APIRedirectURI)&scope=friends&response_type=token&v=\(VKAPIVersion)"
    }
}

