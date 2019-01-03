//
//  RealmWrapper.swift
//  Favorites Food
//
//  Created by Pavel Kurilov on 31.10.2018.
//  Copyright © 2018 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmEntity {
    associatedtype TransientType: TransientEntity where TransientType.RealmType == Self
    
    static func from(transient: TransientType, in realm: Realm) -> Self
    func transient() -> TransientType
}

protocol TransientEntity {
    associatedtype RealmType: RealmEntity where RealmType.TransientType == Self
}

class RealmWrapper: NSObject {

}
