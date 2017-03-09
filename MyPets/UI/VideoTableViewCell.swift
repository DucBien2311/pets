//
//  VideoTableViewCell.swift
//  MyPets
//
//  Created by NguyenDucBien on 2/16/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

protocol VideoTabViewCellDelegate {
    
    func ButtonDidClick()
    
}

class VideoTableViewCell: UITableViewCell {
    
    var delegate: VideoTabViewCellDelegate?
    
    
    var videoPlayBtn = UIButton(type: .custom)
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCTREEN_HEIGTH = UIScreen.main.bounds.size.height
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: .default, reuseIdentifier: nil)
        self.awakeFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        
        videoPlayBtn.frame = CGRect(x: (SCREEN_WIDTH - 200)/2, y: 60, width: 200, height: 100)
        videoPlayBtn.setImage(UIImage(named: "playBtn"), for: UIControlState())
        videoPlayBtn.addTarget(self, action: #selector(self.videoBtnClick), for: .touchUpInside)
        
        self.addSubview(videoPlayBtn)
        
    }
    
    func videoBtnClick() {
        
        delegate?.ButtonDidClick()
    }

    
}
