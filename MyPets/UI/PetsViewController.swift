//
//  PetsViewController.swift
//  MyPets
//
//  Created by Tuuu on 1/3/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class PetsViewController: UIViewController {

    @IBOutlet weak var table_Pets: UITableView!
    
    let database = DataBase.shareInstance
    
    fileprivate var pets = [Pet]()
    fileprivate var petsImage = [PetImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellPet = UINib(nibName: "CellPets", bundle: nil)
        table_Pets.register(cellPet, forCellReuseIdentifier: "CellPet")
        
        table_Pets.dataSource = self
        table_Pets.delegate = self
        
        setButtonForRightBarNavi()
        
        pets = database.getPets()
        petsImage = database.getImagePets(1)

    }
    
    func setButtonForRightBarNavi(){
        
        let rightButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        rightButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightButton
    }
    func add(){
        let viewMileStone = MilestonesViewController(nibName: "MilestonesViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(viewMileStone, animated: true)
    }

}


extension PetsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_Pets.dequeueReusableCell(withIdentifier: "CellPet", for: indexPath) as! CellPets
//        cell.imageView?.image = UIImage(named: "dog1.jpg")
//        cell.textLabel?.text = pets[indexPath.row].name
//        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
}

extension PetsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewDiariesPet = DiaryPetsDetail(nibName: "DiaryPetsDetail", bundle: Bundle.main)
        self.navigationController?.pushViewController(viewDiariesPet, animated: true)
    
    }
}
