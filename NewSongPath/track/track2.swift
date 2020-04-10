//
//  track2.swift
//  NewSongPath
//
//  Created by Cherish Park on 4/9/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//

import UIKit
class track2: UIViewController {
    
    let button = UIButton(type: .system)
    @IBOutlet weak var attendanceView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var xvalue = 8;
        var yvalue = 17;
        var button = UIButton();
        var count = 0
        
        for i in 0..<5{
            for i in 0..<7{
                count+=1
                
                button = UIButton(frame: CGRect(x: xvalue, y: yvalue, width: 50 , height: 50))
                button.backgroundColor = .red
                button.addTarget(attendanceView, action: #selector(buttonAction), for: .touchUpInside)
                self.attendanceView.addSubview(button)
                button.tag = count
                button.setTitle(String(count), for:.normal)
                xvalue = xvalue + 53;
                
            }
            
            xvalue=8;
            yvalue = yvalue + 60;
            
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        switch (sender.tag) {
        case 0:
            button.backgroundColor = UIColor.green
        case 1:
            button.backgroundColor = UIColor.blue
            
        default:
            button.backgroundColor = UIColor.black
            
        }
    }
}
