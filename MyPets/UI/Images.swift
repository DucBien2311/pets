//
//  Images.swift
//  MyPets
//
//  Created by NguyenDucBien on 2/17/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class Images { // for sharing images
    static let sharedInstance = Images()
    private init() {}
    
    var clickedImage: CGFloat!
    
    var cells: [UIImage]!
    
    init(clickedImage: CGFloat, cells: [UIImage]) {
        self.clickedImage = clickedImage
        self.cells = cells
    }
}
