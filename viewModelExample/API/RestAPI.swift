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

struct RestAPI {
    
    var sessionManager: Alamofire.SessionManager!
    
    init(headers params:[AnyHashable:Any]) {
        let headers = self.headers(with: params)
        let configuration = self.configuration(with: headers)
        let trustLolicyManager = ServerTrustPolicyManager(policies: trustPolicies)
        sessionManager = Alamofire.SessionManager(configuration: configuration, delegate: AlamofireSessionDelegate(), serverTrustPolicyManager: trustLolicyManager)
    }
    
    //MARK: - Public -
    
    func callResponse<T>(method:HTTPMethod, type:T.Type, parameters: [String:Any]?, headers:[String:String]?, success:@escaping(T)->Void) where T:Mappable, T:Meta {
        let path = URLPathHelper.buildPath(with: type.url(with: method.rawValue), additional: parameters)
        let encoding = URLEncoding.default
        let queue = DispatchQueue(label: "com.exampleViewModel.responseQueue", qos: .utility, attributes: [.concurrent])
        sessionManager.request(path, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseObject(queue: queue, keyPath: nil, context: nil) { (response: DataResponse<T>) in
            ResponseHelper.parseResponseGetInMain(response: response) { item in
                success(item)
            }
        }
    }

    func cancelAllDataTasks() {
        sessionManager.session.getTasksWithCompletionHandler() { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach{ $0.cancel() }
        }
    }
    
    //MARK: - Private -
    
    private func headers(with params: [AnyHashable:Any]) -> [AnyHashable:Any] {
        var headers = HTTPHeaders.defaultHeaders()
        headers = updatedHeaders(with: params)
        return headers
    }
    
    private func configuration(with headers: [AnyHashable:Any]) -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        return configuration
    }
}

struct HTTPHeaders {
    static func defaultHeaders() -> [AnyHashable:Any] {
        let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        return [
            "Accept"        : "application/json",
            "Content-Type"  : "application/json",
            "X-Device-Key"  :  udid,
            "X-Device-Os"   : "iOS",
            "Authorization" : "Bearer"+" "+token
        ]
    }
}
