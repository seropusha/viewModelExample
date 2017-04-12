//
//  Dialog.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

class Dialog: BaseModel {
    var inRead: Int = 0
    var outRead: Int = 0
    var message = Message()
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        inRead  <- map["in_read"]
        outRead <- map["out_read"]
        message <- map["message"]
    }
}
