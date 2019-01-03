//
//  DetailViewProtocool.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

protocol FoodDetailViewModelProtocol {
    
    var title: String? { get set }
    var description: String? { get set }
    var rating: String? { get set }
    var image: Data? { get set }
    var numberOfRows: Int { get }
    
    func detailCellViewModel(forIndexPath indexPath: IndexPath) -> DetailCellViewModelProtocol?
    func saveData()
}
