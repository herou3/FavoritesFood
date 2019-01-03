//
//  RealmLocation.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 31.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

//import Foundation
//import MapKit
//import RealmSwift
//
//final class RealmLocation: Object, RealmEntity {
//    
//    // MARK: - Properties
//    typealias TransientType = Location
//    private static let taskPrimaryKey = "id"
//    
//    @objc dynamic var name: String?
//    @objc dynamic var locatin: CLLocation?
//    
//    // MARK: - Methods
//    override class func primaryKey() -> String? {
//        return taskPrimaryKey
//    }
//    
//    // MARK: - Realm transform
//    static func from(transient: Location, in realm: Realm) -> RealmLocation {
//        
//        let cached = realm.object(ofType: RealmLocation.self, forPrimaryKey: transient.coordinate)
//        let realmLocation: RealmLocation
//        
//        if let cached = cached {
//            realmC
//        }
//        
//    }
//}
