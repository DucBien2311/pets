//
//  Allergy.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class Allergy {
    var id_allergy = Int64()
    var name: String
    var reaction: String
    var severity: String
    var note: String
    
    init(id_allergy: Int64, name: String, reaction: String, severity: String, note: String) {
        self.id_allergy = id_allergy
        self.name = name
        self.reaction = reaction
        self.severity = severity
        self.note = note
    }
    
}
