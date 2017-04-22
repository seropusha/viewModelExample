//
//  Router.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/8/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

struct Router: RouterProtocol {
    
    weak var navigationController: UINavigationController?
    
    var login: LoginRouter!
    
    init() {}
    
    init!(navigationController: UINavigationController?) {
        assert(navigationController != nil, "navigation controller is nil")
        self.navigationController = navigationController!
        login = LoginRouter(with: navigationController!)
    }
}

