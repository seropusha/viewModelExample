//
//  APIOperation.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/3/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import ObjectMapper

internal enum Method: String {
    case GET
    case POST
}

protocol APIOperation {
    func APICall<T>(method: Method, type:T.Type, params:[String:Any]?, headers:[String:String]?) where T:Mappable,T:Meta
    func proccedResponseObject (response : Any)
}

extension APIOperation where Self : ViewModel {
    
    func APICall<T>(method: Method, type:T.Type, params:[String:Any]?, headers:[String:String]?) where T:Mappable,T:Meta {
        RestAPI.shared.callResponse(method: method, type: type, parameters: params, headers: headers) { genericObject in
            //to do
        }
    }
}
