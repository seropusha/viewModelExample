//
//  BaseModel+Date.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

extension BaseModel {
    func dateFrom(_ map: Map, key: String) -> Date {
        var seconds = TimeInterval()
        seconds <- map[key]
        guard seconds != 0 else { return Date(timeIntervalSince1970: 0) }
        return Date(timeIntervalSince1970: seconds)
    }
}
