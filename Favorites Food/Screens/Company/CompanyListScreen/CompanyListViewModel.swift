//
//  CompanyListViewModel.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift
import MapKit

class CompanyListViewModel: TableListViewModelProtocool {
    
    // MARK: - properties
    private var companies: [Company] = []
    private var selectedIndexPath: IndexPath?
    
    init() {
        companies = [Company(name: "Star Company",
                             imageData: UIImagePNGRepresentation(#imageLiteral(resourceName: "locate-icon")),
                             description: "Decription about star conpany",
                             raiting: "4",
                             id: UUID().uuidString,
                             location: Location(name: "Tomsk", coordinate: CLLocation()),
                             foods: []),
                     Company(name: "Star Company",
                             imageData: UIImagePNGRepresentation(#imageLiteral(resourceName: "locate-icon")),
                             description: "Decription about star conpany",
                             raiting: "4",
                             id: UUID().uuidString,
                             location: Location(name: "Tomsk", coordinate: CLLocation()),
                             foods: [])]
    }
    
    // MARK: - methods TableListViewModelProtocool
    func numberOfRows(numberOfRowsInSection section: Int) -> Int {
        
        return companies.count
    }
    
    func numberOfSections() -> Int {
        
        return 1
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableCellViewModelProtocool? {
        
        return CompanyListCellViewModel(company: companies[indexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        
        self.selectedIndexPath = indexPath
    }
}
