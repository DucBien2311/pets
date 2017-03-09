//
//  Milestone.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class Milestone {
    var id_milestone = Int64()
    var id_pet = Int64()
    var title: String
    var note: String
    
    init(id_milestone: Int64, id_pet: Int64, title: String, note: String) {
        self.id_milestone = id_milestone
        self.id_pet = id_pet
        self.title = title
        self.note = note
}

}
