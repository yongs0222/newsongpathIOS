//
//  track1.swift
//  NewSongPath
//
//  Created by Cherish Park on 4/7/20.
//  Copyright © 2020 New Song Church. All rights reserved.
//
import UIKit
import Firebase

class track1: UIViewController {
    
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    @IBOutlet weak var B10: UIButton!
    @IBOutlet weak var B11: UIButton!
    @IBOutlet weak var B12: UIButton!
    @IBOutlet weak var B13: UIButton!
    @IBOutlet weak var B14: UIButton!
    @IBOutlet weak var B15: UIButton!
    @IBOutlet weak var B16: UIButton!
    @IBOutlet weak var B17: UIButton!
    @IBOutlet weak var B18: UIButton!
    @IBOutlet weak var B19: UIButton!
    @IBOutlet weak var B20: UIButton!
    @IBOutlet weak var B21: UIButton!
    @IBOutlet weak var B22: UIButton!
    @IBOutlet weak var B23: UIButton!
    @IBOutlet weak var B24: UIButton!
    @IBOutlet weak var B25: UIButton!
    @IBOutlet weak var B26: UIButton!
    @IBOutlet weak var B27: UIButton!
    @IBOutlet weak var B28: UIButton!
    @IBOutlet weak var B29: UIButton!
    @IBOutlet weak var B30: UIButton!
    @IBOutlet weak var B31: UIButton!
    
    var check = [
        "1": false,
        "2": false,
        "3": false,
        "4": false,
        "5": false,
        "6": false,
        "7": false,
        "8": false,
        "9": false,
        "10": false,
        "11": false,
        "12": false,
        "13": false,
        "14": false,
        "15": false,
        "16": false,
        "17": false,
        "18": false,
        "19": false,
        "20": false,
        "21": false,
        "22": false,
        "23": false,
        "24": false,
        "25": false,
        "26": false,
        "27": false,
        "28": false,
        "29": false,
        "30": false,
        "31": false,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        B1    .setTitle("    1    ", for: .normal)
        B2    .setTitle("    2    ", for: .normal)
        B3    .setTitle("    3    ", for: .normal)
        B4    .setTitle("    4    ", for: .normal)
        B5    .setTitle("    5    ", for: .normal)
        B6    .setTitle("    6    ", for: .normal)
        B7    .setTitle("    7    ", for: .normal)
        B8    .setTitle("    8    ", for: .normal)
        B9    .setTitle("    9    ", for: .normal)
        B10    .setTitle("    10    ", for: .normal)
        B11    .setTitle("    11    ", for: .normal)
        B12    .setTitle("    12    ", for: .normal)
        B13    .setTitle("    13    ", for: .normal)
        B14    .setTitle("    14    ", for: .normal)
        B15    .setTitle("    15    ", for: .normal)
        B16    .setTitle("    16    ", for: .normal)
        B17    .setTitle("    17    ", for: .normal)
        B18    .setTitle("    18    ", for: .normal)
        B19    .setTitle("    19    ", for: .normal)
        B20    .setTitle("    20    ", for: .normal)
        B21    .setTitle("    21    ", for: .normal)
        B22    .setTitle("    22    ", for: .normal)
        B23    .setTitle("    23    ", for: .normal)
        B24    .setTitle("    24    ", for: .normal)
        B25    .setTitle("    25    ", for: .normal)
        B26    .setTitle("    26    ", for: .normal)
        B27    .setTitle("    27    ", for: .normal)
        B28    .setTitle("    28    ", for: .normal)
        B29    .setTitle("    29    ", for: .normal)
        B30    .setTitle("    30    ", for: .normal)
        B31    .setTitle("    31    ", for: .normal)
        
        
        //        var check = UserDefaults.standard.object(forKey: "test") as? [String:Bool] ?? [String:Bool]()
        
        let check = UserDefaults.standard.object(forKey: "test") as? [String:Bool] ?? [String:Bool]()
        for (key, value) in check{
            if value == true{
        //로딩후, button check value > true 인거 디스플레이
        }
    }
    }
    
    @IBAction func buttonAction(sender: UIButton) {
        let test =  String(sender.tag)
        let checkImage = UIImage(named: "checkmark")! as UIImage
        
        
        
        if check[test]! {
            check[test] = false
            sender.setImage(nil, for: .normal)
            sender.setTitle(test, for: .normal)
            sender.isSelected = false
            
        }else{
            check[test] = true
            sender.setImage(checkImage, for: .normal)
            sender.setTitle(nil, for: .normal)
            sender.isSelected = true
        }
        UserDefaults.standard.set(check, forKey: "test")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
