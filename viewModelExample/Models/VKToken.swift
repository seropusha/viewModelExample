//
//  VKToken.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

class VKToken: NSObject, NSCoding {
    
    var token = ""
    var expiresIn: Date!
    var userID = 0
    
    override init() {
        super.init()
    }
    
    //MARK: NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        token = aDecoder.decodeObject(forKey: "token") as! String
        expiresIn = aDecoder.decodeObject(forKey: "expiresIn") as! Date
        userID = aDecoder.decodeInteger(forKey: "userID")
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(token, forKey: "token")
        aCoder.encode(expiresIn, forKey: "expiresIn")
        aCoder.encode(userID, forKey: "userID")
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

