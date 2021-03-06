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
    
    var items = [Dialog]()
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        items  <- map[JSONResponse+"."+JSONItems]
        pagination.update(offset: items.count)
    }
}

extension Dialogs: Meta {
    static func urlString(with method:Method) -> String {
        switch method {
        case .POST:
            var urlBuilder = URLBuilder(host: .main, method: .dialogs)
            return urlBuilder.build().absoluteString
        default:
            assert(false, "diclare \(method.rawValue) in Dialogs")
            return ""
        }
    }
}

 
