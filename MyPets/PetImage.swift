//
//  PetImage.swift
//  MyPets
//
//  Created by DuongIOS on 2/4/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import Foundation

class PetImage {
    var id_image = Int64()
    var id_pet = Int64()
    var image_path = String()
    
    init(id_image: Int64, id_pet: Int64, image_path: String) {
        self.id_image = id_image
        self.id_pet = id_pet
        self.image_path = image_path
        
    }
    
}
