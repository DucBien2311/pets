//
//  Vaccination.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class Vaccination {
    var id_vaccination = Int64()
    var name: String!
    var received: String
    var remind: Bool!
    var note: String
    
    init(id_vaccination: Int64, name: String!, received: String, remind: Bool!, note: String) {
        self.id_vaccination = id_vaccination
        self.name = name
        self.received = received
        self.remind = remind
        self.note = note
    }
    
}
