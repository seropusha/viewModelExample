//
//  ResponseError.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/20/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

struct ErrorResult: Mappable {
    
    var code    = 0  // info about error codes https://vk.com/dev/errors
    var message = ""
    var params  = [ErrorRequestParams]()
    
    init() {
    }
    
    init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        code    <- map[JSONErrorCode]
        message <- map[JSONErrorMessage]
        params  <- map[JSONRequestParams]
    }
}

struct ErrorRequestParams: Mappable {
    var key   = ""
    var value = ""

    init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        key   <- map[JSONKey]
        value <- map[JSONValue]
    }
}
