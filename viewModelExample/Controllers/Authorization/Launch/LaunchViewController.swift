//
//  LaunchViewController.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        handleSegueToNeedeScreen()
    }
    
    private func handleSegueToNeedeScreen() {
        if DataService.authToken() != nil {
            //to do
        } else {
            //show authorizationScreen with Router
        }
    }

}
