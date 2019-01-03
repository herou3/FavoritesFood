//
//  DetailCellProtocool.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol DetailCellViewModelProtocol {
    
    var value: Data? { get set}
    
    func configure(with data: Data?)
}
