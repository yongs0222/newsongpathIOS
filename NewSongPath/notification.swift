//
//  settingpage.swift
//  newsongtime
//
//  Created by ImSandy on 12/30/19.
//  Copyright © 2019 Newsong church. All rights reserved.
//

import UIKit
import UserNotifications

class notification: UITableViewController{

    @IBOutlet weak var alarmUILabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var settingSwtich: UISwitch!
    @IBOutlet weak var timePcikerUI: UIDatePicker!
    private var selectedDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         

        // tap for action
        let tap = UITapGestureRecognizer(target: self, action: #selector(notification.isEnabled(_:)))
        alarmUILabel.isUserInteractionEnabled = true
        alarmUILabel.addGestureRecognizer(tap)
        
        // save button
        saveButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        
        // time picker init.
        timePcikerUI!.datePickerMode = .time
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm a"
        selectedDate = dateFormatter.string(from: timePcikerUI.date)
        
    }
    
    
   


    @IBAction func isEnabled(_ sender: Any) {
    // show data picker
           timePcikerUI.isHidden = false
           print("clicked")
   //        print(UserDefaults.standard.string(forKey: "alarmTime")!)
    }
    
//    @IBAction func tapFunction(sender: UITapGestureRecognizer) {
//        // show data picker
//        timePcikerUI.isHidden = false
//        print("clicked")
//        print(UserDefaults.standard.string(forKey: "alarmTime")!)
//    }
    
    @objc func didButtonClick(_ sender: UIButton) {
        // hide date picker
        timePcikerUI.isHidden = true
        print("Button clicked")
        // save time
        timePcikerUI!.datePickerMode = .time
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm a"
//        let selectedDate: String = dateFormatter.string(from: timePcikerUI.date)
        
        // notification
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in }
        
        let content = UNMutableNotificationContent()
        content.title = "New Song Path"
        content.body = "오늘의 말씀을 읽으세요."
        
//        UserDefaults.standard.set(selectedDate, forKey: "alarmTime")
//        let saveTime = UserDefaults.standard.string(forKey: "alarmTime")
//        print(saveTime ?? "No Time")
//        let dateObj:Date = dateFormatter.date(from: selectedDate)!
        let dateComponent = Calendar.current.dateComponents([.month,. day, .year, .hour, .minute, .second], from: timePcikerUI.date)
               
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
           
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
           
        center.add(request) { (error) in }
    }
    
}
