//
//  FoodListViewModel.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

protocol FoodListViewModelDelegate: class {
    
    func foodListViewModel(_ viewModel: FoodListViewModel, didSelectFood food: Food)
 //   func foodListViewModelDidReqestSelectEmptyFood(_ viewModel: FoodListViewModel)
}

class FoodListViewModel: TableListViewModelProtocool {
    
    // MARK: - properties
    private var foods: [Food] = []
    private var selectedIndexPath: IndexPath?
    weak var delegate: FoodListViewModelDelegate?
    
    init() {
        foods = [Food(name: "Борщ",
                      imageDate: UIImagePNGRepresentation(#imageLiteral(resourceName: "borsh-image")),
                      descriptions: "Вкусный борщ",
                      rating: "5",
                      id: UUID().uuidString),
                 Food(name: "Роллы",
                      imageDate: UIImagePNGRepresentation(#imageLiteral(resourceName: "rolls-image")),
                      descriptions: "Ролл с семгой",
                      rating: "nove",
                      id: UUID().uuidString)]
    }
    
    // MARK: - methods TableListViewModelProtocool
    func numberOfRows(numberOfRowsInSection section: Int) -> Int {
        
        return foods.count
    }
    
    func numberOfSections() -> Int {
        
        return 1
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableCellViewModelProtocool? {
        
        return FoodCellViewModel(food: foods[indexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        
        self.selectedIndexPath = indexPath
        delegate?.foodListViewModel(self, didSelectFood: foods[indexPath.row])
    }
}
