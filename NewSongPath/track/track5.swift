//
//  track5.swift
//  NewSongPath
//
//  Created by Cherish Park on 4/13/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//



import UIKit
import FSCalendar

class track5: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance{
    
    @IBOutlet weak var cal:FSCalendar!

    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd" // yyyy/MM/dd
        return formatter
    }()
    
    var check = [
        "05/01": false,
        "05/02": false,
        "05/03": false,
        "05/04": false,
        "05/05": false,
        "05/06": false,
        "05/07": false,
        "05/08": false,
        "05/09": false,
        "05/10": false,
        "05/11": false,
        "05/12": false,
        "05/13": false,
        "05/14": false,
        "05/15": false,
        "05/16": false,
        "05/17": false,
        "05/18": false,
        "05/19": false,
        "05/20": false,
        "05/21": false,
        "05/22": false,
        "05/23": false,
        "05/24": false,
        "05/25": false,
        "05/26": false,
        "05/27": false,
        "05/28": false,
        "05/29": false,
        "05/30": false,
        "05/31": false,
    ]
    
    
    var defaults = UserDefaults.standard
//    var selectedDate: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        cal.

        let check = defaults.object(forKey: "saveDate") as? [String:Bool] ?? [:]
        for (key, value) in check{
            if value == true{
                let date = dateFormatter.date(from:key)!
                cal.select(date)
            }
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let str = self.dateFormatter.string(from: date)

        check[str] = true
        defaults.set(check, forKey:"saveDate")
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let str = self.dateFormatter.string(from: date)

        check[str] = false
        defaults.set(check, forKey:"saveDate")
        
    }
}
