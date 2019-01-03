//
//  FoodDetailViewModel.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 20.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

enum CellType: Int {
    case imageCell, nameCell, decriptionCell
}

class FoodDetailViewModel: FoodDetailViewModelProtocol {
    
    // MAARK: - Properties
    private var foodDetailViewModels: [DetailCellViewModelProtocol] = []
    private var food: Food?
    
    var title: String?
    var description: String?
    var rating: String?
    var image: Data?
    var numberOfRows: Int {
        return foodDetailViewModels.count
    }
    
    // MARK: - init / deinit
    init(food: Food) {
        self.food = food
        self.title = food.name
        self.description = food.descriptions
        self.image = food.imageDate
        makeCellsViewModel()
    }
    
    // MARK: - Make cells view model
    private func makeCellsViewModel() {
        let nameCellViewModel = FoodDetailNameCellViewModel(with: title?.data(using: .utf8))
        let decriptionCellViewModel = FoodDetailDecriptionCellViewModel(with: description?.data(using: .utf8))
        let imageCellViewModel = FoodDetailImageCellViewModel(with: image)
        
        foodDetailViewModels.append(imageCellViewModel)
        foodDetailViewModels.append(nameCellViewModel)
        foodDetailViewModels.append(decriptionCellViewModel)
    }
    
    // MARK: - Methods FoodDetailViewModelProtocol
    func detailCellViewModel(forIndexPath indexPath: IndexPath) -> DetailCellViewModelProtocol? {
        
        return foodDetailViewModels[indexPath.row]
    }
    
    func saveData() {
        
    }
}
