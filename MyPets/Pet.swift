//
//  Pet.swift
//  MyPets
//
//  Created by DuongIOS on 2/3/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class Pet {
    let id: Int64?
    var name: String
    var dateOfBirth: String

    
    init(id: Int64) {
        self.id = id
        name = ""
        dateOfBirth = ""

    }
    
    init(id: Int64, name: String, dateOfBirth: String) {
        self.id = id
        self.name = name
        self.dateOfBirth = dateOfBirth

    }
    
}
