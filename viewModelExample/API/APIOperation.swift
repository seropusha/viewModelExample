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
    
    func proccedResponseObject (response : Any){
        //to do
    }
}
