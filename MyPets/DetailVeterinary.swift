//
//  DetailVeterinary.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class DetailVeterinary {
    var id_detailVeterinary = Int64()
    var id_Veterinary = Int64()
    var id_pet = Int64()
    
    init(id_detailVeterinary: Int64, id_Veterinary: Int64, id_pet: Int64) {
        self.id_detailVeterinary = id_detailVeterinary
        self.id_Veterinary = id_Veterinary
        self.id_pet = id_pet
    }
}
