//
//  UIViewController+Alert.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 3/20/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String = "", message: String = "", okButtonHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: okButtonHandler)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
