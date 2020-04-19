//
//  track4.swift
//  NewSongPath
//
//  Created by Cherish Park on 4/9/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import UIKit
import FSCalendar
import FirebaseDatabase
import FirebaseAuth

class track4: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance{
    
    @IBOutlet weak var cal:FSCalendar!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd" // yyyy/MM/dd
        return formatter
    }()
    
    var check = [
        "04/01": false,
        "04/02": false,
        "04/03": false,
        "04/04": false,
        "04/05": false,
        "04/06": false,
        "04/07": false,
        "04/08": false,
        "04/09": false,
        "04/10": false,
        "04/11": false,
        "04/12": false,
        "04/13": false,
        "04/14": false,
        "04/15": false,
        "04/16": false,
        "04/17": false,
        "04/18": false,
        "04/19": false,
        "04/20": false,
        "04/21": false,
        "04/22": false,
        "04/23": false,
        "04/24": false,
        "04/25": false,
        "04/26": false,
        "04/27": false,
        "04/28": false,
        "04/29": false,
        "04/30": false,
        "04/31": false,
    ]
    var uuid = getID().getUUID()

    
//    var defaults = UserDefaults.standard
    //    var selectedDate: [String] = []
    
//    var ref = Database.database().reference()
//
//    var monthRef = Database.database().reference().child("track").childByAutoId().child("04")
//
    //    var postKey = Database.database().reference().child("track").childByAutoId().key
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Retrieving Data from Firebase
        Database.database().reference().child("track").child(uuid!).child("2020/04").observeSingleEvent(of:.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            let current = snapshot.value as! [String: Bool]
                        
            for (key, value) in current{
//                let dataintemp = current[key] as! Bool
                if value == false{
                }
                else{
                    self.cal.select(self.dateFormatter.date(from: "2020/04/\(key)"))
                }
            }
        })
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let test = self.dateFormatter.string(from: date)
        Database.database().reference().child("track").child(uuid!).child(test).setValue(true)//        defaults.set(check, forKey:"saveDate")
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let test = self.dateFormatter.string(from: date)
         Database.database().reference().child("track").child(uuid!).child(test).setValue(false)
                
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition)   -> Bool {
          return monthPosition == .current
      }
}

