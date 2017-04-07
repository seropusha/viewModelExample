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
    static func url(with method:Method) -> String {
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

