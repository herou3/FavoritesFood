//
//  TableCellViewModelProtocool.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit

protocol TableCellViewModelProtocool {
    
    var title: String? { get }
    var rating: String? { get }
    var description: String? { get }
    var imageData: Data? { get }
}
