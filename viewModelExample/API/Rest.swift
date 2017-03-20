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
    
    static func callResponse<T>(method:HTTPMethod, type:T.Type, parameters: [String:Any]?, headers:[String:String]?, success:@escaping(T)->Void) where T:Mappable, T:Meta {
        let path = URLPathHelper.buildPath(with: type.url(with: method.rawValue), additional: parameters)
        let encoding = URLEncoding.default
        let queue = DispatchQueue(label: "com.exampleViewModel.responseQueue", qos: .utility, attributes: [.concurrent])
        let sessionManager = RestAPI.shared.sessionManager
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
    
    private func httpHeaders() -> [AnyHashable:Any] {
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
