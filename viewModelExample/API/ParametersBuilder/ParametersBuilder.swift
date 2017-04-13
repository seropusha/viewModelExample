//
//  ParameterBuilder.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

struct ParametersBuilder {
    
    private var parameters = [String:Any]()
    
    func build() -> [String:Any] {
        return parameters
    }
    
    mutating func add(id: Int) {
        parameters.updateValue(id, forKey: JSONid)
    }
    
    mutating func add(offset: Int, count: Int = 20) {
        parameters.updateValue(offset, forKey: JSONOffset)
        parameters.updateValue(count, forKey: JSONCount)
    }
    
    mutating func add(startMessageId: Int) {
        parameters.updateValue(startMessageId, forKey: JSONStartMessageId)
    }
    
    mutating func add(previewlenght: Int) {
        parameters.updateValue(previewlenght, forKey: JSONPreviewLenght)
    }
    
    mutating func add(isUnread: Bool) {
        parameters.updateValue(isUnread, forKey: JSONUnread)
    }
    
    mutating func add(isImportant: Bool) {
        parameters.updateValue(isImportant, forKey: JSONImportant)
    }
    
    mutating func add(isUnanswered: Bool) {
        parameters.updateValue(isUnanswered, forKey: JSONUnanswered)
    }
    
    mutating func add(key: String) {
        parameters.updateValue(key, forKey: JSONKey)
    }
    
    mutating func add(value: String) {
        parameters.updateValue(value, forKey: JSONValue)
    }
    
    mutating func add(requestParams: String) {
        parameters.updateValue(requestParams, forKey: JSONRequestParams)
    }
    
    mutating func add(date: Date) {
        parameters.updateValue(date.timeIntervalSince1970, forKey: JSONDate)
    }
    
    mutating func add(randomID: Int) {
        parameters.updateValue(randomID, forKey: JSONRandomId)
    }
}
