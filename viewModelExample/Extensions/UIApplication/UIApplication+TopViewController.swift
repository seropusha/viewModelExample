//
//  UIApplication+FrontViewController.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/10/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let navigationController = base as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        if let tabBarController = base as? UITabBarController {
            if let selected = tabBarController.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presentedViewController = base?.presentedViewController {
            return topViewController(presentedViewController)
        }
        if base == nil {
            return UIApplication.shared.delegate?.window??.rootViewController
        }
        return base
    }
}
