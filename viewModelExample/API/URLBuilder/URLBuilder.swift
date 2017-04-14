//
//  URLBuilder.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/14/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

private let startParametersKey  = "?"
private let betweenParameterKey = "&"
private let equalKey            = "="

struct URLBuilder {
    
    private var urlString = ""
    private var isFirstParameter = true
    
    init(host: APIHost, method: APIMethod) {
        switch host {
        case .main:
            urlString += host.rawValue
            urlString += method.rawValue
            urlString += startParametersKey
        case .authorize:
            urlString += host.rawValue
            urlString += startParametersKey
        }
    }
    
    func build() -> URL {
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: encodedString!)
        assert(url != nil, "URL is nil")
        return url!
    }
    
    mutating func add(accessToken: String) {
        addAmpersantIfNotFirstParameter()
        add(value: accessToken, key: URLAccessToken)
    }
    
    mutating func add(clientId: String) {
        addAmpersantIfNotFirstParameter()
        add(value: clientId, key: URLClientID)
    }
    
    mutating func add(display: String) {
        addAmpersantIfNotFirstParameter()
        add(value: display, key: URLDisplay)
    }
    
    mutating func add(redirectUri: String) {
        addAmpersantIfNotFirstParameter()
        add(value: redirectUri, key: URLRedirectUri)
    }
    
    mutating func add(scope: Int) {
        addAmpersantIfNotFirstParameter()
        add(value: "\(scope)", key: URLScope)
    }
    
    mutating func add(responseType: String) {
        addAmpersantIfNotFirstParameter()
        add(value: responseType, key: URLResponseType)
    }
    
    mutating func add(APIVersion: String) {
        addAmpersantIfNotFirstParameter()
        add(value: APIVersion, key: URLAPIVersion)
    }
    
    private mutating func add(value: String, key: String) {
        urlString += key
        urlString += equalKey
        urlString += value
    }
    
    private mutating func addAmpersantIfNotFirstParameter() {
        if !isFirstParameter {
            urlString += betweenParameterKey
        }
        isFirstParameter = false
    }
}
