//
//  PaginationModel.swift
//  viewModelExample
//
//  Created by Valeriya Ponamarenko on 4/20/17.
//  Copyright © 2017 Navka Sergey. All rights reserved.
//

import Foundation

struct PaginationModel {

    var currentPage = 0
    private var totalCount  = 0
    private var offset      = 0
    
    init(totalCount: Int) {
        self.totalCount = totalCount
    }
    
    mutating func update(offset: Int) {
        self.offset = offset
        self.currentPage += 1
    }
    
    func isAvailableNextPage() -> Bool {
        return offset <= totalCount
    }
}
