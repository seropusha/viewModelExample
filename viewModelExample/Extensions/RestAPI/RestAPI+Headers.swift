//
//  RestAPI+Headers.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/3/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

extension RestAPI {
    func updatedHeaders(with params:[String:String]) -> [String:String] {
        let keys = Array(params.keys)
        var temp = [String:String]()
        for key in keys {
            guard let value = params[key] else { return [:] }
            temp.updateValue(value, forKey: key)
        }
        return temp
    }
}
