//
//  Dialogs.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

class Dialogs: BaseArrayModel {
    
    var dialogs = [Dialog]()
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        dialogs  <- map["response"]
    }
}

extension Dialogs: Meta {
    static func urlString(with method:Method) -> String {
        switch method {
        case .POST:
            return host+APIMethod.dialogs.rawValue
        default:
            assert(false, "diclare \(method.rawValue) in Dialogs")
            return ""
        }
    }
}

 
