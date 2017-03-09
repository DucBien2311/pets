//
//  CellPets.swift
//  MyPets
//
//  Created by DuongIOS on 1/11/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class CellPets: UITableViewCell {
    
    @IBOutlet weak var imgPetImage: UIImageView!
    
    @IBOutlet weak var lbNamePet: UILabel!
    
    
    @IBOutlet weak var lbDate: UILabel!
    
    @IBOutlet weak var lbKindAndGender: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        lbDate.textColor = UIColor.orange
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
