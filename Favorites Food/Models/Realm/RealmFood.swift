//
//  RealmFood.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 31.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmFood: Object, RealmEntity {
    
    // MARK: - Properties
    typealias TransientType = Food
    private static let taskPrimaryKey = "id"
    
    @objc dynamic var name: String?
    @objc dynamic var imageDate: Data?
    @objc dynamic var descriptions: String?
    @objc dynamic var rating: String?
    @objc dynamic var id: String = ""
    
    // MARK: - Methods
    override class func primaryKey() -> String? {
        return taskPrimaryKey
    }
    
    // MARK: - Realm transform
    static func from(transient: Food, in realm: Realm) -> RealmFood {
        
        let cached = realm.object(ofType: RealmFood.self, forPrimaryKey: transient.id)
        let realmFood: RealmFood
        
        if let cached = cached {
            realmFood = cached
        } else {
            realmFood = RealmFood()
            realmFood.id = transient.id ?? ""
        }
        
        realmFood.name = transient.name
        realmFood.imageDate = transient.imageDate
        realmFood.descriptions = transient.descriptions
        realmFood.rating = transient.rating
        realmFood.id = transient.id ?? ""
        
        return realmFood
    }
    
    func transient() -> Food {
        
        var transient = Food(name: "",
                             imageDate: Data(),
                             descriptions: "",
                             rating: "",
                             id: UUID().uuidString)
     
        transient.name = name
        transient.descriptions = descriptions
        transient.imageDate = imageDate
        transient.rating = rating
        transient.id = id
        
        return transient
    }
}
