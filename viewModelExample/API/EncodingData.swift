//
//  Encoding.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 3/15/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import Alamofire

struct Encode {
    static func encode(with method: HTTPMethod) -> ParameterEncoding {
        switch method {
        case .get:
            return CustomGetEncoding()
        case .post:
            return CustomPostEncoding()
        default:
            break
        }
        return URLEncoding.default
    }
}

struct CustomPostEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try URLEncoding().encode(urlRequest, with: parameters)
        let httpBody = NSString(data: request.httpBody!, encoding: String.Encoding.utf8.rawValue)!
        request.httpBody = httpBody.replacingOccurrences(of: "%=", with: "sOmEeNcOdE").data(using: .utf8)
        return request
    }
}

struct CustomGetEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try URLEncoding().encode(urlRequest, with: parameters)
        request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%=", with: "sOmEeNcOdE"))
        return request
    }
}
