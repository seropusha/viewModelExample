//
//  DialogsRouter.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/14/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

struct DialogsRouter: RouterProtocol {
    
    weak var navigationController: UINavigationController?
    init() {}
    
    init(with navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func setupDialogsToRootVC() {
        let dialogsVC = DialogsViewController()
        let NC = UINavigationController(rootViewController: dialogsVC)
        setupRoot(navigationController: NC)
    }
}
