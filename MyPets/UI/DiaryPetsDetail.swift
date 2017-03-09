//
//  DiaryPetsDetail.swift
//  MyPets
//
//  Created by NguyenDucBien on 3/6/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class DiaryPetsDetail: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Diary"
        setButtonForRightBarNavi()
    }
    
    func setButtonForRightBarNavi() {
        let rightButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        rightButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    func add() {
        print("321")
    }

   
    

   

}
