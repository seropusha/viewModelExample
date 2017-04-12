//
//  DialogsViewModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

class DialogsViewModel: ViewModel, APIOperation {
    
    func getDialogs() {
        let params = ["":0]
        APICall(method: .POST, type: Dialogs.self, params: params, headers: nil)
    }
    
    //MARK: Response
    
    func proccedResponseObject(response : Any) {
        //to do
    }
}
