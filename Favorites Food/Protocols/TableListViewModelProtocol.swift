//
//  TableListViewModelProtocool.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol TableListViewModelProtocool {
    
    func numberOfRows(numberOfRowsInSection section: Int) -> Int
    func numberOfSections() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableCellViewModelProtocool?
    func selectRow(atIndexPath indexPath: IndexPath)
}
