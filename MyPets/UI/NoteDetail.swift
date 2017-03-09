//
//  NoteDetail.swift
//  MyPets
//
//  Created by NguyenDucBien on 3/6/17.
//  Copyright © 2017 Tuuu. All rights reserved.
//

import UIKit
import UserNotifications

class NoteDetail: UIViewController {
    
    @IBOutlet weak var btnSelectNamePets: UIButton!
    
    
    @IBOutlet weak var tfDataTime: UITextField!
    
    
    @IBOutlet weak var datetimePicker: UIDatePicker!
    
    var deadline = Date()
    var dateFormatter: DateFormatter!
    var selectedName: DropdownNamePets!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, Error in})
        setButtonForRightBarNavi()
        setButtonSelectNamePets()
        
       
    }
    
    func setButtonForRightBarNavi()  {
        
        self.title = "Note Detail"
        let rightButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        rightButton.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightButton
        
    
    }
    
    func setButtonSelectNamePets() {
        
        btnSelectNamePets.layer.cornerRadius = 5
        btnSelectNamePets.layer.borderWidth = 0.1
        
    }
    
    func setDateTime() {
        datetimePicker.datePickerMode = UIDatePickerMode.dateAndTime
        self.view.addSubview(datetimePicker)
        datetimePicker.addTarget(self, action: #selector(NoteDetail.date_time_picker_values_change(_:)), for: UIControlEvents.valueChanged)
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd ' : ' H:mm"
    }

    
    @IBAction func selectNameAction(_ sender: UIButton) {
        selectedName = DropdownNamePets(frame: CGRect(x: btnSelectNamePets.center.x - (btnSelectNamePets.bounds.size.width / 2), y: btnSelectNamePets.center.y + (btnSelectNamePets.bounds.size.height / 2), width: btnSelectNamePets.bounds.size.width, height: btnSelectNamePets.bounds.size.height * 3))
        selectedName.delegate = self
        self.view.addSubview(selectedName)
        selectedName.addTableView()
    }
    
    
    
    
    @IBAction func date_time_picker_values_change(_ sender: UIDatePicker) {
        setDateTime()
        tfDataTime.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func remindNotificationSwitch(_ sender: UISwitch) {
        let content = UNMutableNotificationContent()
        content.title = "Đưa Bob đi chơi công viên!"
        content.subtitle = "Cho Bob ăn"
        content.body = "Check in với Bob :))"
        content.badge = 1
        
        if sender.isOn {
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "Notifications", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }

    
    func save() {
        print("abcd")
    }

}

extension NoteDetail: ChooseNameDelegate {
    func chooseNamePets(index: Int) {
        switch index {
        case 0:
            setNameButtonTitle(name: "Rocky Ngu Đần")
        case 1:
            setNameButtonTitle(name: "Rex Xấu Xí")
        case 2:
            setNameButtonTitle(name: "Bob Mập Ú")
        default:
            break
        }
        
        
    
    }
    
    
    func setNameButtonTitle(name: String) {
        btnSelectNamePets.setTitle(name, for: .normal)
        btnSelectNamePets.titleLabel?.textAlignment = .center
        btnSelectNamePets.backgroundColor = UIColor.orange
        selectedName.tableView.isHidden = true
    }
    
}


