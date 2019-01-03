//
//  Food.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 31.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

struct Food: TransientEntity {
    
    // MARK: - Properties
    typealias RealmType = RealmFood
    
    var name: String?
    var imageDate: Data?
    var descriptions: String?
    var rating: String?
    var id: String?
}
