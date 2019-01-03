//
//  CompanyDetailModelViewProtocol.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 01.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol CompanyDetailModelViewProtocol {
    
    var nameCompany: String { get }
    var description: String { get }
    var companyImage: Data { get }
    var rating: String { get }
    var location: Location { get }
    var foods: [Food] { get }
    
    func detailCellViewModel(forIndexPath indexPath: IndexPath) -> DetailCellViewModelProtocol?
    func saveData()
}
