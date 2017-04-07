//
//  BaseModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel: Mappable {
    
    public var modelID = ""
    
    init() {
    }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        self.modelID  <- map["id"]
    }
}

extension BaseModel: Equatable {
    public static func ==(lhs: BaseModel, rhs: BaseModel) -> Bool {
        return lhs.modelID == rhs.modelID
    }
}
