//
//  NotesViewController.swift
//  MyPets
//
//  Created by NguyenDucBien on 2/28/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonForRightBarNavi()
        
    }

    func setButtonForRightBarNavi(){
        
        let rightButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        rightButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    func add(){
        
        let viewNoteDetail = NoteDetail(nibName: "NoteDetail", bundle: Bundle.main)
        self.navigationController?.pushViewController(viewNoteDetail, animated: true)
    }

    

   

}
