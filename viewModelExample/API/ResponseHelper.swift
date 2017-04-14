//
//  ResponseHelper.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 3/20/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct ResponseHelper {
    static func parseResponseGetInMain<T: Mappable>(response:DataResponse<T>, success:@escaping (T)->Void) {
        switch response.result {
        case .success(let item):
            DispatchQueue.main.async { success(item) }
        case .failure(let error as NSError):
            DispatchQueue.main.async {
                UIApplication.topViewController()?.showAlert(title: "Error"+"\(error.code)", message: error.localizedDescription)
            }
        default:
            break
        }
    }
}
