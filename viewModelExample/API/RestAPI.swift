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
    
    init(with headers:[String:String] = [:]) {
        let innternalHeaders = self.updateHeaders(with: headers)
        let configuration = self.configuration(with: innternalHeaders)
        let trustLolicyManager = ServerTrustPolicyManager(policies: trustPolicies)
        sessionManager = Alamofire.SessionManager(configuration: configuration, delegate: AlamofireSessionDelegate(), serverTrustPolicyManager: trustLolicyManager)
    }
    
    //MARK: - Public -
    
    func callResponse<T>(method:Method, type:T.Type, parameters: [String:Any]?, headers:[String:String]?, success:@escaping(T)->Void) where T:Mappable, T:Meta {
        let path = URLPathHelper.buildPath(with: type.urlString(with: method), additional: parameters)
        let encoding = URLEncoding.default
        let headers = self.updateHeaders(with: headers)
        let queue = DispatchQueue(label: "com.exampleViewModel.responseQueue", qos: .utility, attributes: [.concurrent])
        let methodType = HTTPMethod(rawValue: method.rawValue)!
        sessionManager.request(path, method: methodType, parameters: parameters, encoding: encoding, headers: headers).validate().responseObject(queue: queue, keyPath: nil, context: nil) { (response: DataResponse<T>) in
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
    
    private func updateHeaders(with additionaHeaders: [String:String]?) -> [String:String] {
        var headers = HTTPHeaders.defaultHeaders()
        guard let additionaHeaders = additionaHeaders else { return headers }
        headers = updatedHeaders(with: additionaHeaders)
        return headers
    }
    
    private func configuration(with headers: [String:String]) -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        return configuration
    }
}

struct HTTPHeaders {
    static func defaultHeaders() -> [String:String] {
        let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        return [
            "Accept"        : "application/json",
            "Content-Type"  : "application/json",
            "X-Device-Key"  :  udid,
            "X-Device-Os"   : "iOS",
            //"Authorization" : "Bearer"+" "+token
        ]
    }
}
