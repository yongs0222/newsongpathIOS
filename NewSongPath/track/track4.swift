//
//  track4.swift
//  NewSongPath
//
//  Created by Cherish Park on 4/9/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import UIKit
import FSCalendar

class track4: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance{
    
    @IBOutlet weak var cal:FSCalendar!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd" // yyyy/MM/dd
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
    
    
    var defaults = UserDefaults.standard
//    var selectedDate: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let check = defaults.object(forKey: "saveDate") as? [String:Bool] ?? [:]
        for (key, value) in check{
            if value == true{
                let date = dateFormatter.date(from:key)!
                cal.select(date)
                
                //select되어있는 값 추가되어야함.userdefault, 렘, 코어데이터 중 세이빙/로딩하는거 고민좀..
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
