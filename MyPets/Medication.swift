//
//  Medication.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class Medication {
    var id_medication = Int64()
    var name: String
    var dostage: String
    var frequency: String
    var side_effects: String
    var note: String
    
    init(id_medication: Int64, name: String, dostage: String, frequency: String, side_effects: String, note: String) {
        self.id_medication = id_medication
        self.name = name
        self.dostage = dostage
        self.frequency = frequency
        self.side_effects = side_effects
        self.note = note
    }
    
}
