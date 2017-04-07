//
//  AuthorizationViewModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

class AuthorizationViewModel: ViewModel {
    
    static var authURL: URL {
        return URL(string: VKToken.urlString(with: .GET))!
    }
    
    static var authRequest: URLRequest {
        return URLRequest(url: authURL)
    }
    
}

