//
//  Company.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 01.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation

struct Company: TransientEntity {
    
    typealias RealmType = RealmCompany
    
    var name: String?
    var imageData: Data?
    var description: String?
    var raiting: String?
    var id: String?
    var location: Location?
    var foods: [Food]?
}
