//
//  RouterProtocol.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/8/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    
    weak var navigationController: UINavigationController? {get}
    func setupRoot(viewController: UIViewController)
    func present(_ controller: UIViewController, animated: Bool, completion: (() -> ())?)
    func push(_ controller: UIViewController, animated: Bool)
    func popController(_ animated: Bool)
    func dismissController(_ animated: Bool, completion: (() -> ())?)
    func viewControllerFromStoryboard<T>(_ storyboard: UIStoryboard, type: T.Type) -> T
}

extension RouterProtocol {
    
    func setupRoot(viewController: UIViewController) {
        UIApplication.shared.delegate?.window??.rootViewController = viewController
    }
    
    func present(_ controller: UIViewController, animated: Bool = true, completion: (() -> ())? = nil) {
        navigationController?.present(controller, animated: animated, completion: completion)
    }
    
    func push(_ controller: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(controller, animated: animated)
    }
    
    func popController(_ animated: Bool = true) {
        _ = navigationController?.popViewController(animated: animated)
    }
    
    func popRootController(_ animated: Bool = true) {
        _ = navigationController?.popToRootViewController(animated: animated)
    }
    
    func dismissController(_ animated: Bool = true, completion: (() -> ())? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
    
    func viewControllerFromStoryboard<T>(_ storyboard: UIStoryboard, type: T.Type) -> T {
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T
        assert(viewController != nil, "Can't get \(String(describing: T.self)) from storyboard \(storyboard)")
        return viewController!
    }
}
