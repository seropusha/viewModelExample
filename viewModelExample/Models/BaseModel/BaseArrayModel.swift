//
//  BaseArrayModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseArrayModel: BaseModel {
    
    var countItems = [Any]()
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        countItems  <- map[JSONCount]
    }
}
