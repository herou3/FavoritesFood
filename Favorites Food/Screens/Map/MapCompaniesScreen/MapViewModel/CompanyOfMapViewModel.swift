//
//  CompanyOfMapViewModel.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 01.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

class CompanyOfMapViewModel {
    
    private var company: Company?
    
    var nameCompany: String {
        return company?.name ?? ""
    }
    var description: String {
        return company?.description ?? ""
    }
    var companyImage: Data {
        return company?.imageData ?? Data()
    }
    var rating: String {
        return company?.raiting ?? ""
    }
    var location: Location {
        return company?.location ?? Location()
    }
    var foods: [Food] {
        return company?.foods ?? []
    }
    
    init(company: Company?) {
        self.company = company
    }
}
