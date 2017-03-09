//
//  Veterinary.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class Veterinary {
    var id_veterinary = Int64()
    var name: String
    var phone: String
    var address: String
    var note: String
    
    init(id_veterinary: Int64, name: String, phone: String, address: String, note: String) {
        self.id_veterinary = id_veterinary
        self.name = name
        self.phone = phone
        self.address = address
        self.note = note
    }
    
}
