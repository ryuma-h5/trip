////
//  Realm.swift
//  Trip
//
//  Created by Ryuma Harada on 2019/05/09.
//  Copyright © 2019 Ryuma Harada. All rights reserved.
//

import Foundation
import RealmSwift

final class PhotoLocation: Object {
    
    @objc dynamic var image: Data = Data()
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var logtitude: Double = 0.0
    @objc dynamic var createdAt = Date(timeIntervalSince1970: 1)
    @objc dynamic var textMemo = ""
    @objc dynamic var spa_mark1: Data = Data()
    @objc dynamic var spa_mark2: Data = Data()
    @objc dynamic var spa_mark3: Data = Data()
    @objc dynamic var spa_mark4: Data = Data()
    @objc dynamic var spa_mark5: Data = Data()
    @objc dynamic var date: String = String()

    
    

    
}




