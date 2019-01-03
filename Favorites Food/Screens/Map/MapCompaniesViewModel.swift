//
//  с.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 30.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import UIKit
import MapKit

class MapCompaniesViewModel {
    
    private var companies: [Company] = []
    
    init() {
        companies = [Company(name: "Star Company",
                             imageData: UIImagePNGRepresentation(#imageLiteral(resourceName: "locate-icon")),
                             description: "Decription about star conpany",
                             raiting: "4",
                             id: UUID().uuidString,
                             location: Location(name: "Tomsk", coordinate: CLLocation()),
                             foods: []),
                     Company(name: "Star Company",
                             imageData: UIImagePNGRepresentation(#imageLiteral(resourceName: "locate-icon")),
                             description: "Decription about star conpany",
                             raiting: "4",
                             id: UUID().uuidString,
                             location: Location(name: "Tomsk", coordinate: CLLocation()),
                             foods: [])]
    }
}
