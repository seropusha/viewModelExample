//
//  LaunchClass.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/10/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class LaunchClass {
    
    var window: UIWindow?
    
    static let shared: LaunchClass = {
        return LaunchClass()
    }()
    
    func application(didFinishLaunchingWithOptions launchOptions: [AnyHashable: Any]?, window: UIWindow?) -> Bool {
        self.window = window ?? UIWindow()
        self.window?.makeKeyAndVisible()
        
        setupStartScreen()
        return true
    }
    
    func setupStartScreen() {
        setupDialogsVC()
        if !UsersService.isHaveActiveToken() {
            setupLoginRouterAndPresentVC()
        }
    }
    
    //MARK: Private
    
    private func setupDialogsVC() {
        let dialogsRouter = DialogsRouter(with: nil)
        dialogsRouter.setupDialogsToRootVC()
    }
    
    private func setupLoginRouterAndPresentVC() {
        let navigationController: UINavigationController?
        if let NC = window?.rootViewController as? UINavigationController {
            navigationController = NC
        } else {
            navigationController = UINavigationController()
            window?.rootViewController = navigationController
        }
        let loginRouter = LoginRouter(with: navigationController)
        loginRouter.presentAuthorizationVC()
    }
}
