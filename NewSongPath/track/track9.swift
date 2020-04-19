//
//  track9.swift
//  NewSongPath
//
//  Created by Cherish Park on 4/18/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import Foundation

import UIKit
import FSCalendar
import FirebaseDatabase

class track9: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance{
    
    @IBOutlet weak var cal: FSCalendar!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    var uuid = getID().getUUID()

    var ref = Database.database().reference()
    
    var monthRef = Database.database().reference().child("track").childByAutoId()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let test = self.dateFormatter.date(from: "2020/09/01")
                cal.setCurrentPage(test!, animated: true)
        
           
           //Retrieving Data from Firebase
        Database.database().reference().child("track").child(uuid!).child("2020/09").observeSingleEvent(of:.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
               let current = snapshot.value as! [String: Bool]
               for (key, value) in current{
//                   let dataintemp = current[key] as! Bool
                   if value == false{
                   }
                   else{
                       self.cal.select(self.dateFormatter.date(from: "2020/09/\(key)"))
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


