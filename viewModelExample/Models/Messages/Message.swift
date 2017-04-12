//
//  Message.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

class Message: BaseModel {
    var date: Date!
    var timestamp = 0
    var isOut  = false
    var userID = 0
    var isRead = false
    var title  = ""
    var body   = ""
    var randomID = 0
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        date = dateFrom(map, key: "date")
        timestamp <- map["date"]
        isOut     <- map["out"]
        userID    <- map["user_id"]
        isRead    <- map["read_state"]
        title     <- map["title"]
        body      <- map["body"]
        randomID  <- map["random_id"]
    }
}
