//
//  BaseViewController.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/10/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
   
    lazy var router: Router! = Router(navigationController: self.navigationController)
    
}
