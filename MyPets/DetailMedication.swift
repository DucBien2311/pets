//
//  DetailMedication.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class DetailMedication {
    var id_detailmedication = Int64()
    var id_medication = Int64()
    var id_pet = Int64()
    
    init(id_detailmedication: Int64, id_medication: Int64, id_pet: Int64) {
        self.id_detailmedication = id_detailmedication
        self.id_medication = id_medication
        self.id_pet = id_pet
    }
}
