//
//  DetailVaccination.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class DetailVaccination {
    var id_detailVaccination = Int64()
    var id_vaccination = Int64()
    var id_pet = Int64()
    
    init(id_detailVaccination: Int64, id_vaccination: Int64, id_pet: Int64) {
        self.id_detailVaccination = id_detailVaccination
        self.id_vaccination = id_vaccination
        self.id_pet = id_pet
    }
}
