//
//  track1.swift
//  NewSongPath
//
//  Created by Cherish Park on 4/13/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//



import UIKit
import FSCalendar
import FirebaseDatabase

class track1: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance{
    
    @IBOutlet weak var cal: FSCalendar!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    
    //initialize key
    var uuid = getID().getUUID()

    override func viewDidLoad() {
        super.viewDidLoad()
        let test = self.dateFormatter.date(from: "2020/01/01")
                cal.setCurrentPage(test!, animated: true)
                   
           //Retrieving Data from Firebase
        Database.database().reference().child("track").child(uuid!).child("2020/01").observeSingleEvent(of:.value, with:{(snapshot) in
            if !snapshot.exists() { return }
            
               let current = snapshot.value as! [String: Bool]
               for (key, value) in current{
//                   let dataintemp = current[key] as! Bool
                   if value == false{
                   }
                   else{
                       self.cal.select(self.dateFormatter.date(from: "2020/01/\(key)"))
                   }
               }
           })
    }
      
    // 날짜 선택됬을때 + 파베로 세이브
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            let test = self.dateFormatter.string(from: date)
            Database.database().reference().child("track").child(uuid!).child(test).setValue(true)
        }
    
    // 날짜 선택 취소됬을때 + 파베로 세이브
        func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
            let test = self.dateFormatter.string(from: date)
            Database.database().reference().child("track").child(uuid!).child(test).setValue(false)
        }

    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition)   -> Bool {
              return monthPosition == .current
          }
    }


