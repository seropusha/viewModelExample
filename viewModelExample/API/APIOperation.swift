//
//  APIOperation.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/3/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

protocol APIOperation {
    func APICall<T>(method: HTTPMethod, type:T.Type, params:[String:Any]?, headers:[String:String]) where T:Mappable,T:Meta
    func proccedResponseObject (response : Any)
}

extension APIOperation where Self : ViewModel {
    func APICall<T>(method: HTTPMethod, type:T.Type, params:[String:Any]?, headers:[String:String]) where T:Mappable,T:Meta {
        let API = RestAPI()
        API.callResponse(method: method, type: type, parameters: params, headers: headers) { genericObject in
            //to do
        }
    }
}
