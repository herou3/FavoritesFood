//
//  FoodCellViewModel.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 31.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

class FoodCellViewModel: TableCellViewModelProtocool {
    
    private var food: Food
    
    var title: String? {
        let title: String = food.name ?? ""
        return title
    }
    
    var description: String? {
        return food.descriptions
    }
    
    var imageData: Data? {
        return food.imageDate ?? Data()
    }
    
    var rating: String? {
        return food.rating
    }
    
    init(food: Food) {
        self.food = food
    }
}
