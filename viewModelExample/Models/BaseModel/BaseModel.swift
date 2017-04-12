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
        key   <- map["key"]
        value <- map["value"]
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
        code    <- map["error_code"]
        message <- map["error_msg"]
        params  <- map["request_params"]
    }
}


class BaseModel: Mappable {
    
    var modelID = ""
    var code    = 0
    var error   = ErrorResult()
    
    init() {
    }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        modelID  <- map["id"]
        error    <- map["error"]
    }
}

extension BaseModel: Equatable {
    public static func ==(lhs: BaseModel, rhs: BaseModel) -> Bool {
        return lhs.modelID == rhs.modelID
    }
}
