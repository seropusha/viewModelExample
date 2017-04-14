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
        let perrmissionsResult = PermissionUser.scope(with: [.frinds, .photos, .audio, .video, .status, .notes, .messages, .offline, .email])
        var urlBuilder = URLBuilder(host: .authorize, method: .none)
        urlBuilder.add(clientId: VKAppID)
        urlBuilder.add(display: "page")
        urlBuilder.add(redirectUri: APIRedirectURI)
        urlBuilder.add(scope: perrmissionsResult)
        urlBuilder.add(responseType: "token")
        return urlBuilder.build().absoluteString
    }
}

