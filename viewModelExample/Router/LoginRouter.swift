//
//  RouterLogin.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/8/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

struct LoginRouter: RouterProtocol {

    weak var navigationController: UINavigationController?
    init() {}
    
    init(with navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func presentAuthorizationVC(_ animation: Bool = true) {
        let authVC = AuthorizationViewController()
        push(authVC, animated: animation)
    }
}
