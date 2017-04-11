//
//  ViewModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/3/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func viewModelDidStartUpdate()
    func viewModelDidEndUpdate()
}

class ViewModel {
    weak var delegate: ViewModelDelegate? {
        didSet { delegate?.viewModelDidStartUpdate() }
    }
    
}
