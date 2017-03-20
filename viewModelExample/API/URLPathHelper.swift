//
//  URLPathHelper.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 3/20/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

struct URLPathHelper {
    static func buildPath(with currentPath: String, additional urlParameters: [String:Any]?) -> String {
        guard let params = urlParameters else { return currentPath }
        guard let value = params[URLParameterKey.additionalPath.rawValue] as? String else { return currentPath }
        return currentPath+"/"+value
    }
}
