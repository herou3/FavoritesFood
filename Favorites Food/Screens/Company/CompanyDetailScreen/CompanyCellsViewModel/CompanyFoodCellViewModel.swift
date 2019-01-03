//
//  CompanyFoodCellViewModel.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 22.12.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

class CompanyFoodCellViewModel: DetailCellViewModelProtocol {
    
    // MARK: - Propertie
    var value: Data?
    
    // MARK: - init / deinit
    init(with value: Data?) {
        self.configure(with: value)
    }
    
    // MARK: - Configure self
    func configure(with data: Data?) {
        self.value = data
    }
}
