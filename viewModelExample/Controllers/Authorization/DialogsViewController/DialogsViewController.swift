//
//  DialogsViewController.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class DialogsViewController: BaseViewController {
    
    let viewModel = DialogsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadDialogs(offset: 0)
    }
    
}
