 //
//  AuthorizationViewController.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/7/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import UIKit

class AuthorizationViewController: BaseViewController {

    let webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        webView.loadRequest(AuthorizationViewModel.authRequest)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.frame
    }

}

extension AuthorizationViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.isHasAccessToken()  {
            if let token = request.parseAccessToken() {
                UsersService.setAuth(token: token)
                self.dismiss(animated: true, completion: nil)
                return false
            }
        }
        return true
    }
}
