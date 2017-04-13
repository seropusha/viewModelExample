//
//  DialogsViewModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

class DialogsViewModel: ViewModel, APIOperation {
    
    func loadDialogs(offset: Int, startMessageID: Int, previewLenght: Int = 40, isUnread: Bool, isImportant: Bool, isUnanswered: Bool) {
        var parameterBuilder = ParametersBuilder()
        parameterBuilder.add(offset: offset)
        parameterBuilder.add(startMessageId: startMessageID)
        parameterBuilder.add(previewlenght: previewLenght)
        parameterBuilder.add(isUnread: isUnread)
        parameterBuilder.add(isImportant: isImportant)
        parameterBuilder.add(isUnanswered: isImportant)
        APICall(method: .POST, type: Dialogs.self, params: parameterBuilder.build(), headers: nil)
    }
    
    //MARK: Response
    
    func proccedResponseObject(response : Any) {
        //to do
    }
}
