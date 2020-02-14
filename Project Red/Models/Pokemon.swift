//
//  Pokemon.swift
//  Project Red
//
//  Created by Aaron Suarez on 1/25/20.
//  Copyright © 2020 Aaron Suarez. All rights reserved.
//

import Foundation
import RealmSwift

class Pokemon: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var count: Int = 0
}
