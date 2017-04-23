//
//  DialogsViewModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/12/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

protocol DialogsProvider {
    func loadDialogs(offset: Int, startMessageID: Int, previewLenght: Int, isUnread: Bool, isImportant: Bool, isUnanswered: Bool)
}

class DialogsViewModel: ViewModel, APIOperation, DialogsProvider {
    
    func loadDialogs(offset: Int, startMessageID: Int = 0, previewLenght: Int = 40, isUnread: Bool = false, isImportant: Bool = false, isUnanswered: Bool = false) {
        var parameterBuilder = ParametersBuilder()
        parameterBuilder.add(offset: offset)
        parameterBuilder.add(previewlenght: previewLenght)
        parameterBuilder.add(isUnread: isUnread)
        parameterBuilder.add(isImportant: isImportant)
        parameterBuilder.add(isUnanswered: isUnanswered)
        if startMessageID > 0 {
            parameterBuilder.add(startMessageId: startMessageID)
        }
        APICall(method: .POST, type: Dialogs.self, params: parameterBuilder.build(), headers: nil)
    }
    
    //MARK: - APIOperation proceed response
    
    func proccedResponseObject<T>(response: T) {
        switch response {
        case is Dialogs:
            print("TO DO HANDLE RESPONSE \(response.self)")
            break
        default:
            break
        }
    }
}
