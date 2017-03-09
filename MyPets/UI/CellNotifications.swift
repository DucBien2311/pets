//
//  CellTips.swift
//  MyPets
//
//  Created by DuongIOS on 1/12/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class CellNotifications: BaseTableViewCell {

    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "CellCollection", bundle: nil)
        myCollectionView.register(nib, forCellWithReuseIdentifier: "CellCollection")
        
        myCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CellNotifications: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as! CellCollection
        cell.imageTip.image = UIImage(named: "dog.jpg")
        cell.lbl_Tip.text = "Introduce about takecare dog"
        cell.lbl_Tip.textColor = UIColor.orange
        return cell
    }
}
