//
//  Media.swift
//  MyPets
//
//  Created by NguyenDucBien on 2/16/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit


class MediaItems {
    
    var name:String!
    var urlThumb: String
    var urlVideo: String
    
    init(name: String, urlThumb: String, urlVideo: String) {
        
        self.name = name
        self.urlThumb = urlThumb
        self.urlVideo = urlVideo
    }
}
