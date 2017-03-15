//
//  Rest.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 3/15/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

private let trustPolicies: [String: ServerTrustPolicy] = [host:.disableEvaluation]

class RestAPI {
    
    static let shared : RestAPI = {
        return RestAPI()
    }()
    
    lazy var sessionManager: Alamofire.SessionManager = { [weak self] in
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = self?.httpHeaders()
        let trustLolicyManager = ServerTrustPolicyManager(policies: trustPolicies)
        return Alamofire.SessionManager(configuration: configuration, delegate: AlamofireSessionDelegate(), serverTrustPolicyManager: trustLolicyManager)
    }()
    
    static func callResponse<T>(method:HTTPMethod, type:T.Type, params: [String:Any]?, headers:[String:String], success:@escaping(T)->Void) where T:Mappable, T:Meta {
        
    }
//    static func callAPIResponse <T:Mappable> (method: HTTPMethod, type:T.Type, params:Dictionary<String, Any>?, headers: Dictionary<String, String>?, success:@escaping (T)->Void)->Void where T:Mappable,T:Meta {
//        
//        var paramEncoding: ParameterEncoding = URLEncoding.default
//        
//        if method == .get {
//            paramEncoding = CustomGetEncoding()
//        } else if method == .post {
//            paramEncoding = CustomPostEncoding()
//        }
//        let fullPath = checkFullUrlPath(currentPath: type.url_get!(method: method.rawValue), params: params)
//        print(fullPath)
//        
//        RestApiClass.sharedInstance.defaultManager.request(fullPath, method:method, parameters: params, encoding: paramEncoding, headers:headers).validate().responseObject(queue: nil, keyPath: nil, context: nil) { (response: DataResponse<T>) in
//            
//            proccedResponse(response: response, success: { (result) in
//                success(result)
//            })
//        }
//    }
    
    //MARK: - Private -
    
    private func httpHeaders() -> [AnyHashable:Any] {
        let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        return [
                "Accept"        : "application/json",
                "Content-Type"  : "application/json",
                "X-Device-Key"  :  udid,
                "X-Device-Os"   : "iOS",
                "Authorization" : "bearer"+" "+token
                ]
    }
    
}
