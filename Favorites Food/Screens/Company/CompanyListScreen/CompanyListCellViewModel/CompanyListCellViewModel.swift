//
//  CompanyListCellViewModel.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 02.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

class CompanyListCellViewModel: TableCellViewModelProtocool {
    
    private var company: Company
    
    var title: String? {
        let title: String = company.name ?? ""
        return title
    }
    
    var rating: String? {
        return company.raiting
    }
    
    var description: String? {
        return company.description
    }
    
    var imageData: Data? {
        return company.imageData ?? Data()
    }
    
    init(company: Company) {
        self.company = company
    }
}
