//
//  MilestonesViewController.swift
//  MyPets
//
//  Created by Tuuu on 1/3/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit


class MilestonesViewController: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var chooseImageAvatarFromCamera: UIButton!
    
    @IBOutlet weak var btnChooseKind: UIButton!
    
    
    @IBOutlet weak var btnChooseGender: UIButton!
    
    
    @IBOutlet weak var tfDateTime: UITextField!
    
    
    @IBOutlet weak var tfNamePets: UITextField!
    
    
    @IBOutlet weak var deadlinePicker: UIDatePicker!
    
    
    
    
    var dropMenu: DropdownMenu!
    var dateFormatter: DateFormatter!
    var deadline = Date()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        setLayerForButton()
        setButtonForRightBarNavi()
        
        
        btnChooseGender.setTitle("Choose Gender", for: .normal)
        btnChooseKind.setTitle("Choose Kind", for: .normal)
        
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        setImageViewCircle()
        
    }
    
    func setImageViewCircle(){
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        
    }
    func setButtonForRightBarNavi(){
        
        let rightButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        rightButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightButton
        self.title = "Add Pets"
    }
    
    func setLayerForButton() {
        chooseImageAvatarFromCamera.layer.cornerRadius = 5
        chooseImageAvatarFromCamera.backgroundColor = UIColor.orange
        chooseImageAvatarFromCamera.layer.borderWidth = 0.1
        chooseImageAvatarFromCamera.titleLabel?.tintColor = UIColor.white
        
        btnChooseKind.layer.cornerRadius = 5
        btnChooseKind.backgroundColor = UIColor.orange
        btnChooseKind.layer.borderWidth = 0.1
        
        btnChooseGender.layer.cornerRadius = 5
        btnChooseGender.backgroundColor = UIColor.orange
        btnChooseGender.layer.borderWidth = 0.1
    }
    
    func setDataTime() {
        deadlinePicker.datePickerMode = UIDatePickerMode.dateAndTime
        self.view.addSubview(deadlinePicker)
        deadlinePicker.addTarget(self, action: #selector(MilestonesViewController.date_time_picker_change_action(_:)), for: UIControlEvents.valueChanged)
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd  ' : ' H:mm"
    }
    
    
    
    func save(){
        
    }
    
    @IBAction func buttonImageAvatar(_ sender: UIButton) {
        //        self.view.alpha = 0.5
        let picker = UIImagePickerController()
        picker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func btnChooseGender(_ sender: UIButton) {
        dropMenu = DropdownMenu(frame: CGRect(x: btnChooseGender.center.x - (btnChooseGender.bounds.size.width / 2), y: btnChooseGender.center.y + (btnChooseGender.bounds.size.height / 2), width: btnChooseGender.bounds.size.width, height: btnChooseGender.bounds.size.height * 3))
        dropMenu.delegate = self
        self.view.addSubview(dropMenu)
        dropMenu.addTableView()
        dropMenu.selectedButton(index: 2)
        btnChooseGender.isEnabled = false
        btnChooseKind.isEnabled = false
        
    }
    
    
    
    @IBAction func btnChooseKind(_ sender: UIButton) {
        dropMenu = DropdownMenu(frame: CGRect(x: btnChooseKind.center.x - (btnChooseKind.bounds.size.width / 2), y: btnChooseKind.center.y + (btnChooseKind.bounds.size.height / 2), width: btnChooseKind.bounds.size.width, height: btnChooseKind.bounds.size.height * 3))
        dropMenu.delegate = self
        self.view.addSubview(dropMenu)
        dropMenu.addTableView()
        dropMenu.selectedButton(index: 1)
        btnChooseKind.isEnabled = false
        btnChooseGender.isEnabled = false
        
    }
    
    @IBAction func date_time_picker_change_action(_ sender: UIDatePicker) {
        
        setDataTime()
        tfDateTime.text = dateFormatter.string(from: sender.date)
    }
    
    
    
    
}

extension MilestonesViewController: UIImagePickerControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFill
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension MilestonesViewController: ChooseDelegate {
    func chooseGender(index: Int) {
        
        
        if index == 0
        {
            setGenderButtonTitle(gender: "Male")
        }else
        {
            setGenderButtonTitle(gender: "Female")
        }
    }
    
    func setGenderButtonTitle(gender: String)
    {
        btnChooseGender.setTitle(gender, for: .normal)
        btnChooseGender.titleLabel?.textAlignment = .center
        btnChooseGender.isEnabled = true
        btnChooseKind.isEnabled = true
        dropMenu.tableView.isHidden = true
    }
    
    func chooseKind(index: Int) {
        switch index {
        case 0:
            setKindButtonTitle(kind: "Dog")
        case 1:
            setKindButtonTitle(kind: "Cat")
        case 2:
            setKindButtonTitle(kind: "Fish")
        case 3:
            setKindButtonTitle(kind: "Bird")
        case 4:
            setKindButtonTitle(kind: "Mouse")
        case 5:
            setKindButtonTitle(kind: "Rabbit")
            
        default:
            break
        }
        
        
    }
    
    func setKindButtonTitle(kind: String)
    {
        btnChooseKind.setTitle(kind, for: .normal)
        btnChooseKind.titleLabel?.textAlignment = .center
        btnChooseKind.isEnabled = true
        btnChooseGender.isEnabled = true
        dropMenu.tableView.isHidden = true
    }
    
}







