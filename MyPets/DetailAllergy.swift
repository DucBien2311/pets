//
//  DetailAllergy.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class DetailAllergy {
    var id_detailallergy = Int64()
    var id_allergy = Int64()
    var id_pet = Int64()
    
    init(id_detailallergy: Int64, id_allergy: Int64, id_pet: Int64) {
        self.id_detailallergy = id_detailallergy
        self.id_allergy = id_allergy
        self.id_pet = id_pet
    }
}
