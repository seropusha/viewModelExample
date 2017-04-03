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
    func APICall<T>(method: HTTPMethod, modelType:T.Type, params:[String:Any]?, headers:[AnyHashable:Any]) where T:Mappable,T:Meta
    func proccedResponseObject (response : Any)
}
