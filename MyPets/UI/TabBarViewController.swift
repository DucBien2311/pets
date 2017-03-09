////
////  TabBarViewController.swift
////  MyPets
////
////  Created by NguyenDucBien on 2/16/17.
////  Copyright © 2017 Tuuu. All rights reserved.
////
//
//import UIKit
//
//class TabBarViewController: UITabBarController, UITabBarControllerDelegate{
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            
//            self.title = "Videos"
//            
//            delegate = self
//        }
//        
//        
//        override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            
//            let item1 = PetVideosViewController()
//            let item2 = UIViewController()
//            let icon1 = UITabBarItem(title: "Images", image: nil, selectedImage: nil)
//            let icon2 = UITabBarItem(title: "Videos", image: nil, selectedImage: nil)
//            item1.tabBarItem = icon1
//            item2.tabBarItem = icon2
//            
//            let controllers = [item1,item2]
//            self.viewControllers = controllers
//            
//        }
//        
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        return true;
//    }
//        
//        
//    
//
//}
