//
//  MainTabBarViewController.swift
//  MyPets
//
//  Created by Tuuu on 1/3/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    var notesVC: NotesViewController?
    var petsVC: PetsViewController?
    var notificationsVC: NotificationsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [setupNotesView(), setupPetsView(), setupNotificationsView()]
        tabBar.barTintColor = UIColor(red: 0.97, green: 0.48, blue: 0.15, alpha: 1.0)
        tabBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    func setupNotesView() -> MyPetsNavigationController
    {
        let noteVC = NotesViewController(nibName: "NotesViewController", bundle: nil)
        noteVC.title = "Notes"
        self.notesVC = noteVC
        
        let nNoteVC = MyPetsNavigationController(rootViewController: noteVC)
        let noteVCBarItem = UITabBarItem(title: "NOTES", image: UIImage(named: "notes.png"), selectedImage: UIImage(named: "selectedImage.png"))
        nNoteVC.tabBarItem = noteVCBarItem
        
        return nNoteVC
    }
    func setupPetsView() -> MyPetsNavigationController
    {
        let petsVC = PetsViewController(nibName: "PetsViewController", bundle: nil)
        petsVC.title = "Pets"
        self.petsVC = petsVC
        
        let nPetsVC = MyPetsNavigationController(rootViewController: petsVC)
        let petsVCBarItem = UITabBarItem(title: "PETS", image: UIImage(named: "pet.png"), selectedImage: UIImage(named: "selectedImage.png"))
        nPetsVC.tabBarItem = petsVCBarItem
        return nPetsVC
    }
    func setupNotificationsView() -> MyPetsNavigationController
    {
        let notificationsVC = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        notificationsVC.title = "Notifications"
        self.notificationsVC = notificationsVC
        
        let nNotificationsVC = MyPetsNavigationController(rootViewController: notificationsVC)
        let notificationsVCBarItem = UITabBarItem(title: "NOTIFICATIONS", image: UIImage(named: "elemental-tip.png"), selectedImage: UIImage(named: "selectedImage.png"))
        nNotificationsVC.tabBarItem = notificationsVCBarItem
        return nNotificationsVC
    }
//    func setupSettingsView() -> MyPetsNavigationController
//    {
//        let settingsVC = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
//        settingsVC.title = "Settings"
//        self.settingsVC = settingsVC
//        
//        let nSettingsVC = MyPetsNavigationController(rootViewController: settingsVC)
//        let settingsVCBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings.png"), selectedImage: UIImage(named: "selectedImage.png"))
//        nSettingsVC.tabBarItem = settingsVCBarItem
//        return nSettingsVC
//    }

}
