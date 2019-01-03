//
//  RealmCompany.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 01.11.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmCompany: Object, RealmEntity {
    
    // MARK: - Properties
    typealias TransientType = Company
    private static let taskPrimaryKey = "id"
    
    @objc dynamic var name: String?
    @objc dynamic var imageDate: Data?
    @objc dynamic var descriptions: String?
    @objc dynamic var rating: String?
    @objc dynamic var id: String = ""
    var foods: [Food]?
    var location: Location?
    
    // MARK: - Methods
    override class func primaryKey() -> String? {
        return taskPrimaryKey
    }
    
    // MARK: - Realm transform
    static func from(transient: Company, in realm: Realm) -> RealmCompany {
        
        let cached = realm.object(ofType: RealmCompany.self, forPrimaryKey: transient.id)
        let realmCompany: RealmCompany
        
        if let cached = cached {
            realmCompany = cached
        } else {
            realmCompany = RealmCompany()
            realmCompany.id = transient.id ?? ""
        }
        
        realmCompany.name = transient.name
        realmCompany.imageDate = transient.imageData
        realmCompany.descriptions = transient.description
        realmCompany.rating = transient.raiting
        realmCompany.id = transient.id ?? ""
        realmCompany.foods = transient.foods
        realmCompany.location = transient.location
        
        return realmCompany
    }
    
    func transient() -> Company {
        
        var transient = Company(name: "",
                                imageData: Data(),
                                description: "", raiting: "",
                                id: "",
                                location: Location(),
                                foods: [Food()])
        
        transient.name = name
        transient.description = descriptions
        transient.imageData = imageDate
        transient.raiting = rating
        transient.id = id
        transient.foods = foods
        transient.location = location
        
        return transient
    }
}
