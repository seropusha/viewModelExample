//
//  BaseModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

class ErrorRequestParams: Mappable {
    var key   = ""
    var value = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        key   <- map[JSONKey]
        value <- map[JSONValue]
    }
}

class ErrorResult: Mappable {
    
    var code    = 0  // info about error codes https://vk.com/dev/errors
    var message = ""
    var params = [ErrorRequestParams]()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        code    <- map[JSONErrorCode]
        message <- map[JSONErrorMessage]
        params  <- map[JSONRequestParams]
    }
}


class BaseModel: Mappable {
    
    var id      = 0
    var code    = 0
    var error   = ErrorResult()
    
    init() {
    }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        id       <- map[JSONid]
        error    <- map[JSONError]
    }
}

extension BaseModel: Equatable {
    public static func ==(lhs: BaseModel, rhs: BaseModel) -> Bool {
        return lhs.id == rhs.id
    }
}
